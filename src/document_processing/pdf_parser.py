import os
import logging
from typing import List, Dict, Any
from pypdf import PdfReader

logger = logging.getLogger(__name__)

class PDFParser:
    @staticmethod
    def extract_text_by_page(pdf_path: str) -> List[Dict[str, Any]]:
        """
        Extracts text from each page of a PDF file, tracking the 1-based page index.
        Returns a list of dicts: [{'page_number': int, 'text': str}]
        """
        if not os.path.exists(pdf_path):
            raise FileNotFoundError(f"PDF file not found at {pdf_path}")
            
        logger.info(f"Starting text extraction for: {pdf_path}")
        pages_data = []
        
        try:
            reader = PdfReader(pdf_path)
            total_pages = len(reader.pages)
            logger.info(f"Total pages in document: {total_pages}")
            
            for idx, page in enumerate(reader.pages):
                page_num = idx + 1
                text = page.extract_text()
                
                # Simple cleaning
                if text:
                    text_cleaned = text.strip()
                else:
                    text_cleaned = ""
                    
                pages_data.append({
                    "page_number": page_num,
                    "text": text_cleaned
                })
                
            logger.info(f"Successfully extracted {len(pages_data)} pages from {pdf_path}")
            return pages_data
            
        except Exception as e:
            logger.error(f"Error parsing PDF file {pdf_path}: {str(e)}")
            raise e
