import pytest
from src.rag.qa_chain import RAGQuestionAnswering
from src.vector_store.manager import VectorStoreManager

def test_rag_fallback_empty_context():
    """Verifies that RAG QA chain correctly returns the fallback string when context is missing."""
    # Initialize QA chain with a default VectorStoreManager (which will be empty)
    vector_manager = VectorStoreManager()
    qa_chain = RAGQuestionAnswering(vector_manager)
    
    query = "What is the training batch size of the deep learning model?"
    
    # Run QA with an empty vector index
    result = qa_chain.answer_question(
        query=query,
        user_id="test-user-456",
        doc_ids=None,
        search_mode="hybrid",
        chat_history=[]
    )
    
    assert "answer" in result
    assert "citations" in result
    assert "latency_ms" in result
    
    # Confirm it returns the strict fallback message
    assert "I cannot determine the answer" in result["answer"]


def test_multi_user_isolation_retrieval():
    """Verifies that queries retrieve only chunks belonging to the current user."""
    vector_manager = VectorStoreManager()
    
    # Inject test chunks for User A
    vector_manager.add_chunks([
        {
            "chunk_id": "chunk-A-1",
            "doc_id": "doc-A",
            "page_number": 1,
            "text": "User A proprietary batch size is 128.",
            "user_id": "user-A"
        }
    ])
    
    # Inject test chunks for User B
    vector_manager.add_chunks([
        {
            "chunk_id": "chunk-B-1",
            "doc_id": "doc-B",
            "page_number": 1,
            "text": "User B proprietary batch size is 256.",
            "user_id": "user-B"
        }
    ])
    
    # User A queries
    results_A = vector_manager.hybrid_search(
        query="proprietary batch size",
        user_id="user-A",
        k=5
    )
    assert len(results_A) > 0
    # Every returned chunk must belong to user-A
    for chunk in results_A:
        assert chunk["doc_id"] == "doc-A"
        assert "128" in chunk["text"]
        assert "256" not in chunk["text"]
        
    # User B queries
    results_B = vector_manager.hybrid_search(
        query="proprietary batch size",
        user_id="user-B",
        k=5
    )
    assert len(results_B) > 0
    # Every returned chunk must belong to user-B
    for chunk in results_B:
        assert chunk["doc_id"] == "doc-B"
        assert "256" in chunk["text"]
        assert "128" not in chunk["text"]
