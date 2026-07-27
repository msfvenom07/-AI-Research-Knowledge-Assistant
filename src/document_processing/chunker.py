import logging
from typing import List, Dict, Any
from langchain_text_splitters import RecursiveCharacterTextSplitter

logger = logging.getLogger(__name__)

class DocumentChunker:
    def __init__(self, chunk_size: int = 1000, chunk_overlap: int = 150):
        self.chunk_size = chunk_size
        self.chunk_overlap = chunk_overlap
        self.splitter = RecursiveCharacterTextSplitter(
            chunk_size=chunk_size,
            chunk_overlap=chunk_overlap,
            length_function=len,
            separators=["\n\n", "\n", " ", ""]
        )

    def create_chunks(self, pages_data: List[Dict[str, Any]], doc_id: str) -> List[Dict[str, Any]]:
        """
        Splits page text into overlapping chunks while preserving doc_id and page_number.
        
        Args:
            pages_data: List of dicts, each with 'page_number' and 'text'.
            doc_id: The unique document ID.
            
        Returns:
            List of chunk dicts: [
                {
                    'chunk_id': str, 
                    'doc_id': str, 
                    'page_number': int, 
                    'text': str
                }
            ]
        """
        logger.info(f"Chunking document {doc_id} with size={self.chunk_size}, overlap={self.chunk_overlap}")
        chunks = []
        global_chunk_idx = 0
        
        for page in pages_data:
            page_num = page["page_number"]
            page_text = page["text"]
            
            if not page_text.strip():
                continue
                
            # Split the text of this specific page
            page_splits = self.splitter.split_text(page_text)
            
            for split_text in page_splits:
                if not split_text.strip():
                    continue
                    
                chunks.append({
                    "chunk_id": f"{doc_id}_c{global_chunk_idx}",
                    "doc_id": doc_id,
                    "page_number": page_num,
                    "text": split_text.strip()
                })
                global_chunk_idx += 1
                
        logger.info(f"Generated {len(chunks)} chunks for document {doc_id}")
        return chunks
