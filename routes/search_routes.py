import json
import logging
import time
from typing import List, Optional
from fastapi import APIRouter, HTTPException, Depends
from fastapi.responses import StreamingResponse
from pydantic import BaseModel, Field
from sqlalchemy.orm import Session
from src.database.base import get_db
from src.database.models import ChatMessage, QueryAnalytics, DocumentMetadata, User
from src.database.auth import get_current_user
from src.vector_store.manager import VectorStoreManager
from src.rag.qa_chain import RAGQuestionAnswering

logger = logging.getLogger(__name__)
router = APIRouter(prefix="/search", tags=["Semantic Search & Q&A"])

# Initialize Vector Manager and QA Chain
vector_manager = VectorStoreManager()
qa_chain = RAGQuestionAnswering(vector_manager)

class SearchRequest(BaseModel):
    query: str = Field(..., description="The search query text.")
    doc_ids: Optional[List[str]] = Field(default=None, description="Optional list of document IDs to restrict search scope.")
    search_mode: str = Field(default="hybrid", description="Search mode: 'semantic', 'keyword', or 'hybrid'.")
    k: int = Field(default=4, description="Number of results to retrieve.")

class QARequest(BaseModel):
    query: str = Field(..., description="The question to ask the assistant.")
    session_id: str = Field(..., description="Unique user session ID for maintaining conversational memory.")
    doc_ids: Optional[List[str]] = Field(default=None, description="Optional list of document IDs to restrict search scope.")
    search_mode: str = Field(default="hybrid", description="Search mode: 'semantic', 'keyword', or 'hybrid'.")


@router.post("/query")
def search_documents(
    request: SearchRequest,
    current_user: User = Depends(get_current_user)
):
    """Performs dense vector, sparse keyword, or reciprocal-rank hybrid search across user's uploaded documents."""
    mode = request.search_mode.lower()
    
    if mode == "semantic":
        results = vector_manager.semantic_search(request.query, user_id=current_user.user_id, doc_ids=request.doc_ids, k=request.k)
    elif mode == "keyword":
        results = vector_manager.keyword_search(request.query, user_id=current_user.user_id, doc_ids=request.doc_ids, k=request.k)
    elif mode == "hybrid":
        results = vector_manager.hybrid_search(request.query, user_id=current_user.user_id, doc_ids=request.doc_ids, k=request.k)
    else:
        raise HTTPException(status_code=400, detail="Invalid search_mode. Options are: 'semantic', 'keyword', 'hybrid'.")
        
    return results


@router.post("/qa")
def ask_question(
    request: QARequest, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    RAG-based Question Answering. Uses retrieved chunks to formulate a citation-grounded response.
    Maintains session-based multi-turn conversation memory.
    """
    session_id = request.session_id
    
    # 1. Fetch previous session history from SQLite DB for current user
    history_records = db.query(ChatMessage)\
        .filter(ChatMessage.session_id == session_id, ChatMessage.user_id == current_user.user_id)\
        .order_by(ChatMessage.timestamp.asc())\
        .all()
        
    chat_history = [
        {"role": rec.role, "content": rec.content}
        for rec in history_records
    ]
    
    # 2. Run RAG Question Answering Chain
    try:
        qa_result = qa_chain.answer_question(
            query=request.query,
            user_id=current_user.user_id,
            doc_ids=request.doc_ids,
            search_mode=request.search_mode,
            chat_history=chat_history
        )
    except Exception as e:
        logger.error(f"Error in RAG QA execution: {str(e)}")
        raise HTTPException(status_code=500, detail=f"QA failed: {str(e)}")
        
    # 3. Store conversation history in SQL DB
    user_msg = ChatMessage(session_id=session_id, role="user", content=request.query, user_id=current_user.user_id)
    assistant_msg = ChatMessage(session_id=session_id, role="assistant", content=qa_result["answer"], user_id=current_user.user_id)
    
    db.add(user_msg)
    db.add(assistant_msg)
    db.commit()
    
    # 4. Log analytics
    referenced_docs = []
    seen_refs = set()
    for citation in qa_result["citations"]:
        doc_name = citation["document"]
        if doc_name not in seen_refs:
            seen_refs.add(doc_name)
            doc_meta = db.query(DocumentMetadata.doc_id).filter(DocumentMetadata.file_name == doc_name).first()
            referenced_docs.append({
                "doc_id": doc_meta[0] if doc_meta else "",
                "file_name": doc_name
            })
            
    analytics_record = QueryAnalytics(
        query=request.query,
        response=qa_result["answer"],
        latency_ms=qa_result["latency_ms"],
        referenced_docs=json.dumps(referenced_docs),
        user_id=current_user.user_id
    )
    db.add(analytics_record)
    db.commit()
    
    return {
        "answer": qa_result["answer"],
        "citations": qa_result["citations"],
        "latency_ms": round(qa_result["latency_ms"], 2)
    }


@router.post("/qa/stream")
async def ask_question_stream(
    request: QARequest,
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """
    RAG-based Question Answering returning Server-Sent Events (SSE) chunks.
    Saves message history and logs analytics on completion.
    """
    session_id = request.session_id
    
    # 1. Fetch previous session history
    history_records = db.query(ChatMessage)\
        .filter(ChatMessage.session_id == session_id, ChatMessage.user_id == current_user.user_id)\
        .order_by(ChatMessage.timestamp.asc())\
        .all()
        
    chat_history = [
        {"role": rec.role, "content": rec.content}
        for rec in history_records
    ]
    
    # 2. SSE Generator wrapper
    def event_generator():
        start_time = time.time()
        full_response = []
        citations = []
        
        generator = qa_chain.answer_question_stream(
            query=request.query,
            user_id=current_user.user_id,
            doc_ids=request.doc_ids,
            search_mode=request.search_mode,
            chat_history=chat_history
        )
        
        for chunk in generator:
            yield chunk
            # Accumulate text for SQL logs
            if chunk.startswith("content:"):
                full_response.append(chunk[len("content:"): -1])
            elif chunk.startswith("metadata:"):
                try:
                    meta_data = json.loads(chunk[len("metadata:"): -1])
                    citations = meta_data.get("citations", [])
                except Exception:
                    pass
                    
        latency_ms = (time.time() - start_time) * 1000
        final_answer = "".join(full_response)
        
        # Save to DB in generator context
        try:
            from src.database.base import SessionLocal
            bg_db = SessionLocal()
            
            user_msg = ChatMessage(
                session_id=session_id,
                role="user",
                content=request.query,
                user_id=current_user.user_id
            )
            assistant_msg = ChatMessage(
                session_id=session_id,
                role="assistant",
                content=final_answer,
                user_id=current_user.user_id
            )
            bg_db.add(user_msg)
            bg_db.add(assistant_msg)
            bg_db.commit()
            
            referenced_docs = []
            seen_refs = set()
            for citation in citations:
                doc_name = citation["document"]
                if doc_name not in seen_refs:
                    seen_refs.add(doc_name)
                    doc_meta = bg_db.query(DocumentMetadata.doc_id).filter(DocumentMetadata.file_name == doc_name).first()
                    referenced_docs.append({
                        "doc_id": doc_meta[0] if doc_meta else "",
                        "file_name": doc_name
                      })
                      
            analytics_record = QueryAnalytics(
                query=request.query,
                response=final_answer,
                latency_ms=latency_ms,
                referenced_docs=json.dumps(referenced_docs),
                user_id=current_user.user_id
            )
            bg_db.add(analytics_record)
            bg_db.commit()
            bg_db.close()
        except Exception as db_err:
            logger.error(f"Error saving stream logs: {str(db_err)}")
            
    return StreamingResponse(event_generator(), media_type="text/event-stream")


@router.delete("/session/{session_id}")
def clear_session_history(
    session_id: str, 
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """Clears conversational memory for a specific user session."""
    db.query(ChatMessage).filter(ChatMessage.session_id == session_id, ChatMessage.user_id == current_user.user_id).delete()
    db.commit()
    return {"message": f"Conversational history for session '{session_id}' cleared successfully."}
