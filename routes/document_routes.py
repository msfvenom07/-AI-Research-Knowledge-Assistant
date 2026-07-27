import os
import uuid
import logging
from datetime import datetime
from typing import List
from fastapi import APIRouter, UploadFile, File, HTTPException, BackgroundTasks, Depends
from sqlalchemy.orm import Session
from config.settings import settings
from src.database.base import get_db
from src.database.models import DocumentMetadata, User
from src.database.auth import get_current_user
from src.document_processing.pdf_parser import PDFParser
from src.document_processing.chunker import DocumentChunker
from src.ml.predictor import DocumentClassifier
from src.vector_store.manager import VectorStoreManager

logger = logging.getLogger(__name__)
router = APIRouter(prefix="/documents", tags=["Document Management"])

# Initialize Vector Manager and Classifier locally
vector_manager = VectorStoreManager()
classifier = DocumentClassifier()

def process_pdf_pipeline(doc_id: str, file_path: str, file_name: str, user_id: str, db_session_factory):
    """
    Background worker pipeline that processes an uploaded PDF:
    Parses pages, runs ML classification, chunks text, and indexes in ChromaDB.
    """
    logger.info(f"Background task started for document {doc_id} ('{file_name}') for user {user_id}")
    db = db_session_factory()
    
    # Fetch the metadata record
    db_doc = db.query(DocumentMetadata).filter(DocumentMetadata.doc_id == doc_id).first()
    if not db_doc:
        logger.error(f"Document {doc_id} not found in database metadata.")
        db.close()
        return
        
    try:
        # 1. Update status to PROCESSING
        db_doc.processing_status = "PROCESSING"
        db.commit()
        
        # 2. Extract Text Page-by-page
        pages_data = PDFParser.extract_text_by_page(file_path)
        total_pages = len(pages_data)
        db_doc.total_pages = total_pages
        db.commit()
        
        # 3. Classify Category using TensorFlow / Fallback
        sample_text = " ".join([page["text"] for page in pages_data[:3]])
        predicted_category = classifier.predict_category(sample_text)
        db_doc.category = predicted_category
        db.commit()
        
        # 4. Chunk text page-by-page
        chunker = DocumentChunker()
        chunks = chunker.create_chunks(pages_data, doc_id)
        
        # Inject file_name and user_id into chunks for RAG context extraction and isolation
        for chunk in chunks:
            chunk["file_name"] = file_name
            chunk["user_id"] = user_id
            
        total_chunks = len(chunks)
        db_doc.total_chunks = total_chunks
        db.commit()
        
        # 5. Index chunks in Vector Database (ChromaDB)
        vector_manager.add_chunks(chunks)
        
        # 6. Set status to PROCESSED
        db_doc.processing_status = "PROCESSED"
        db.commit()
        logger.info(f"Document {doc_id} successfully processed and indexed.")
        
    except Exception as e:
        logger.error(f"Error processing document {doc_id}: {str(e)}")
        db_doc.processing_status = "FAILED"
        db.commit()
    finally:
        db.close()

@router.post("/upload")
async def upload_documents(
    background_tasks: BackgroundTasks, 
    files: List[UploadFile] = File(...), 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """Uploads one or more PDF documents and triggers background processing."""
    uploaded_docs = []
    
    for file in files:
        if not file.filename.lower().endswith(".pdf"):
            raise HTTPException(status_code=400, detail=f"Only PDF files are supported. File '{file.filename}' rejected.")
            
        doc_id = str(uuid.uuid4())
        # Clean up filename to prevent directory traversal issues
        safe_filename = os.path.basename(file.filename)
        dest_filename = f"{doc_id}_{safe_filename}"
        file_path = os.path.join(settings.RAW_DOCS_DIR, dest_filename)
        
        # Save file to disk
        try:
            with open(file_path, "wb") as f:
                content = await file.read()
                f.write(content)
        except Exception as e:
            logger.error(f"Failed to write file {safe_filename} to disk: {str(e)}")
            raise HTTPException(status_code=500, detail="Failed to save uploaded file to disk.")
            
        # Create SQLite metadata record
        db_doc = DocumentMetadata(
            doc_id=doc_id,
            file_name=safe_filename,
            upload_timestamp=datetime.utcnow(),
            total_pages=0,
            total_chunks=0,
            processing_status="PENDING",
            category="Uncategorized",
            file_path=file_path,
            user_id=current_user.user_id
        )
        db.add(db_doc)
        db.commit()
        db.refresh(db_doc)
        
        # Trigger background processing pipeline
        from src.database.base import SessionLocal
        background_tasks.add_task(
            process_pdf_pipeline, 
            doc_id, 
            file_path, 
            safe_filename, 
            current_user.user_id,
            SessionLocal
        )
        
        uploaded_docs.append({
            "doc_id": doc_id,
            "file_name": safe_filename,
            "status": "PENDING"
        })
        
    return {
        "message": f"Successfully uploaded {len(uploaded_docs)} document(s). Processing started in background.",
        "documents": uploaded_docs
    }

@router.get("")
def list_documents(
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """Returns metadata list of all uploaded documents for the current user."""
    docs = db.query(DocumentMetadata)\
        .filter(DocumentMetadata.user_id == current_user.user_id)\
        .order_by(DocumentMetadata.upload_timestamp.desc())\
        .all()
    return docs

@router.get("/{doc_id}")
def get_document_metadata(
    doc_id: str, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """Returns metadata for a specific document belonging to the user."""
    doc = db.query(DocumentMetadata)\
        .filter(DocumentMetadata.doc_id == doc_id, DocumentMetadata.user_id == current_user.user_id)\
        .first()
    if not doc:
        raise HTTPException(status_code=404, detail="Document not found.")
    return doc

@router.delete("/{doc_id}")
def delete_document(
    doc_id: str, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """Deletes a user's document from metadata, ChromaDB index, and raw disk storage."""
    doc = db.query(DocumentMetadata)\
        .filter(DocumentMetadata.doc_id == doc_id, DocumentMetadata.user_id == current_user.user_id)\
        .first()
    if not doc:
        raise HTTPException(status_code=404, detail="Document not found.")
        
    # 1. Delete vector index chunks from ChromaDB
    vector_manager.delete_document_chunks(doc_id)
    
    # 2. Delete raw file from disk
    if os.path.exists(doc.file_path):
        try:
            os.remove(doc.file_path)
        except Exception as e:
            logger.error(f"Error removing raw document file at {doc.file_path}: {str(e)}")
            
    # 3. Delete metadata record from SQL DB
    db.delete(doc)
    db.commit()
    
    return {"message": f"Document '{doc.file_name}' deleted successfully."}

@router.post("/{doc_id}/reprocess")
def reprocess_document(
    doc_id: str, 
    background_tasks: BackgroundTasks, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """Manually triggers reprocessing for a document belonging to the user."""
    doc = db.query(DocumentMetadata)\
        .filter(DocumentMetadata.doc_id == doc_id, DocumentMetadata.user_id == current_user.user_id)\
        .first()
    if not doc:
        raise HTTPException(status_code=404, detail="Document not found.")
        
    # Clear any old chunks from ChromaDB first
    vector_manager.delete_document_chunks(doc_id)
    
    # Reset status
    doc.processing_status = "PENDING"
    db.commit()
    
    from src.database.base import SessionLocal
    background_tasks.add_task(
        process_pdf_pipeline, 
        doc_id, 
        doc.file_path, 
        doc.file_name, 
        current_user.user_id,
        SessionLocal
    )
    
    return {"message": f"Reprocessing started for document '{doc.file_name}'."}
