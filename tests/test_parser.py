import pytest
from src.document_processing.chunker import DocumentChunker

def test_chunker_segmentation():
    """Verifies that the recursive document chunker splits text correctly and preserves page mappings."""
    chunker = DocumentChunker(chunk_size=100, chunk_overlap=20)
    
    pages_data = [
        {"page_number": 1, "text": "This is page one text that is relatively long and needs to be split into chunks."},
        {"page_number": 2, "text": "Short page text."}
    ]
    
    doc_id = "test_doc_001"
    chunks = chunker.create_chunks(pages_data, doc_id)
    
    assert len(chunks) > 0
    
    # Check schema of chunks
    first_chunk = chunks[0]
    assert "chunk_id" in first_chunk
    assert "doc_id" in first_chunk
    assert "page_number" in first_chunk
    assert "text" in first_chunk
    
    assert first_chunk["doc_id"] == doc_id
    
    # Verify page number mappings
    page_numbers = [c["page_number"] for c in chunks]
    assert 1 in page_numbers
    assert 2 in page_numbers
    
    # Verify that the short page was not truncated
    short_page_chunks = [c for c in chunks if c["page_number"] == 2]
    assert len(short_page_chunks) == 1
    assert short_page_chunks[0]["text"] == "Short page text."
