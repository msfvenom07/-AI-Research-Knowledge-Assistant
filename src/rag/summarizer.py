import logging
from typing import Dict, Any, Optional
from config.settings import settings
from src.vector_store.manager import VectorStoreManager
from src.rag.qa_chain import RAGQuestionAnswering

logger = logging.getLogger(__name__)

class DocumentSummarizer:
    def __init__(self, vector_manager: Optional[VectorStoreManager] = None):
        self.vector_manager = vector_manager or VectorStoreManager()
        self.qa_chain = RAGQuestionAnswering(self.vector_manager)

    def _call_llm_summarize(self, full_text: str, doc_name: str) -> str:
        """Invokes the configured LLM to generate a structured summary."""
        prompt = f"""You are an expert technical editor. Summarize the following document titled "{doc_name}".
Your summary MUST be structured into exactly four sections:
1. EXECUTIVE SUMMARY: A high-level overview of the document's purpose, scope, and key conclusions.
2. TECHNICAL SUMMARY: A deeper dive into the technical details, parameters, architectures, or formulas used.
3. BULLET POINT BREAKDOWN: A list of the core features, facts, or findings of the document.
4. KEY TAKEAWAYS: 3-5 critical lessons or insights.

Document Text:
{full_text}

Provide the response in clean, professional markdown format using the headers above.
"""
        # Call configured LLM using the qa_chain methods
        has_api_keys = (self.qa_chain.provider == "gemini" and settings.GEMINI_API_KEY) or \
                       (self.qa_chain.provider == "openai" and settings.OPENAI_API_KEY)
                       
        if self.qa_chain.provider == "ollama":
            return self.qa_chain._call_ollama(prompt)
        elif has_api_keys:
            if self.qa_chain.provider == "openai":
                return self.qa_chain._call_openai(prompt)
            else:  # gemini
                return self.qa_chain._call_gemini(prompt)
        else:
            raise ValueError("No API keys found for LLM summarization.")

    def summarize_document(self, doc_id: str, doc_name: str) -> Dict[str, Any]:
        """Retrieves document chunks, manages context sizing, and returns a structured summary."""
        logger.info(f"Summarizing document {doc_id} ('{doc_name}')")
        
        # Retrieve all chunks for the document
        chunks = self.vector_manager._get_all_chunks_for_docs([doc_id])
        if not chunks:
            return {
                "doc_id": doc_id,
                "file_name": doc_name,
                "summary": "No document content indexed to summarize."
            }
            
        # Sort chunks by page and id to maintain document flow
        chunks_sorted = sorted(chunks, key=lambda x: (x["page_number"], x["chunk_id"]))
        
        # Concatenate text up to a safe length (e.g. 10000 characters for LLMs)
        text_segments = []
        char_count = 0
        max_chars = 12000
        
        for c in chunks_sorted:
            if char_count + len(c["text"]) > max_chars:
                # Add a notice of truncation if we exceed max size
                text_segments.append(f"\n[... Document truncated for summarization context ...]\n")
                break
            text_segments.append(c["text"])
            char_count += len(c["text"])
            
        full_text = "\n\n".join(text_segments)
        
        # Attempt LLM-based summarization
        try:
            summary_markdown = self._call_llm_summarize(full_text, doc_name)
            return {
                "doc_id": doc_id,
                "file_name": doc_name,
                "summary": summary_markdown
            }
        except Exception as e:
            logger.warning(f"LLM Summarization failed: {str(e)}. Generating rule-based summary fallback.")
            
            # Local offline rule-based summarizer fallback
            intro_text = chunks_sorted[0]["text"][:600]
            concl_text = chunks_sorted[-1]["text"][:600]
            
            # Simple keyword highlights extraction
            sentences = []
            for c in chunks_sorted[:3]:
                sentences.extend(c["text"].split(". "))
            
            highlights = []
            for s in sentences:
                s_clean = s.strip()
                if len(s_clean) > 40 and any(w in s_clean.lower() for w in ["significant", "result", "propose", "system", "architecture", "evaluate", "method"]):
                    highlights.append(s_clean + ".")
                    if len(highlights) >= 4:
                        break
            if not highlights:
                highlights = [s.strip() + "." for s in sentences[:4] if len(s.strip()) > 20]
                
            summary_fallback = f"""# Executive & Technical Summary for {doc_name}
*(Offline Rule-Based Mock Summary)*

## EXECUTIVE SUMMARY
This document focuses on the technical specification and context extracted from "{doc_name}". The early sections describe:
> "{intro_text}..."

## TECHNICAL SUMMARY
The document details various procedures and structural configurations. Analysis of the concluding chapters indicates findings related to:
> "...{concl_text}"

## BULLET POINT BREAKDOWN
Here are the extracted highlights and key sentences from the document's content:
{chr(10).join([f'* {h}' for h in highlights])}

## KEY TAKEAWAYS
1. The document presents a technical study structured across {chunks_sorted[-1]['page_number']} pages.
2. The core content highlights topics related to the document's domain classification.
3. System parameters and architectures are indexed into {len(chunks)} searchable database segments.
"""
            return {
                "doc_id": doc_id,
                "file_name": doc_name,
                "summary": summary_fallback
            }
