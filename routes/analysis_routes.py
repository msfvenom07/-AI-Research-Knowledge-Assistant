import logging
from typing import List
from fastapi import APIRouter, HTTPException, Depends
from pydantic import BaseModel, Field
from sqlalchemy.orm import Session
from src.database.base import get_db
from src.database.models import DocumentMetadata, User
from src.database.auth import get_current_user
from src.rag.summarizer import DocumentSummarizer
from src.rag.comparator import DocumentComparator
from src.ml.predictor import DocumentClassifier

logger = logging.getLogger(__name__)
router = APIRouter(prefix="/analysis", tags=["Document Analysis & ML Classification"])

# Initialize Engines
summarizer = DocumentSummarizer()
comparator = DocumentComparator()
classifier = DocumentClassifier()

class SummarizeRequest(BaseModel):
    doc_id: str = Field(..., description="The ID of the document to summarize.")

class CompareRequest(BaseModel):
    doc_ids: List[str] = Field(..., description="List of document IDs to compare (minimum 2).")

class ClassifyRequest(BaseModel):
    text: str = Field(..., description="The text content to classify into tech categories.")


@router.post("/summarize")
def summarize_document_endpoint(
    request: SummarizeRequest, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """Generates structured summaries (Executive, Technical, Bullet points, Takeaways) for a document belonging to the user."""
    doc = db.query(DocumentMetadata)\
        .filter(DocumentMetadata.doc_id == request.doc_id, DocumentMetadata.user_id == current_user.user_id)\
        .first()
    if not doc:
        raise HTTPException(status_code=404, detail="Document not found.")
        
    if doc.processing_status != "PROCESSED":
        raise HTTPException(status_code=400, detail=f"Document is in state '{doc.processing_status}' and cannot be summarized yet.")
        
    try:
        result = summarizer.summarize_document(request.doc_id, doc.file_name)
        return result
    except Exception as e:
        logger.error(f"Summarization endpoint failed: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))


@router.post("/compare")
def compare_documents_endpoint(
    request: CompareRequest, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """Compares Methodologies, Advantages, Differences, and Implementation of multiple uploaded documents belonging to the user."""
    if len(request.doc_ids) < 2:
        raise HTTPException(status_code=400, detail="Select at least two documents for comparison.")
        
    doc_names = []
    for doc_id in request.doc_ids:
        doc = db.query(DocumentMetadata)\
            .filter(DocumentMetadata.doc_id == doc_id, DocumentMetadata.user_id == current_user.user_id)\
            .first()
        if not doc:
            raise HTTPException(status_code=404, detail=f"Document '{doc_id}' not found.")
        if doc.processing_status != "PROCESSED":
            raise HTTPException(status_code=400, detail=f"Document '{doc.file_name}' is not processed yet.")
        doc_names.append(doc.file_name)
        
    try:
        result = comparator.compare_documents(request.doc_ids, doc_names)
        return result
    except Exception as e:
        logger.error(f"Comparison endpoint failed: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))


@router.post("/classify")
def classify_text_endpoint(
    request: ClassifyRequest,
    current_user: User = Depends(get_current_user)
):
    """Predicts which technology category a given text chunk belongs to using the TensorFlow model."""
    try:
        predicted_cat = classifier.predict_category(request.text)
        return {
            "text_sample": request.text[:200] + "..." if len(request.text) > 200 else request.text,
            "predicted_category": predicted_cat
        }
    except Exception as e:
        logger.error(f"Classification endpoint failed: {str(e)}")
        raise HTTPException(status_code=500, detail=str(e))
