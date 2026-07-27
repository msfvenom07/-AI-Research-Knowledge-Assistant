import logging
from typing import List, Dict, Any, Optional
from config.settings import settings
from src.vector_store.manager import VectorStoreManager
from src.rag.qa_chain import RAGQuestionAnswering

logger = logging.getLogger(__name__)

class DocumentComparator:
    def __init__(self, vector_manager: Optional[VectorStoreManager] = None):
        self.vector_manager = vector_manager or VectorStoreManager()
        self.qa_chain = RAGQuestionAnswering(self.vector_manager)

    def _call_llm_compare(self, comparison_context: str, doc_names: List[str]) -> str:
        """Invokes the configured LLM to generate a markdown comparison analysis."""
        prompt = f"""You are an expert systems research reviewer. Compare the following documents: {', '.join(doc_names)}.
Analyze the documents based on their retrieved text and fill out a comprehensive comparative report.
Your output MUST contain:
1. COMPARISON MATRIX (Markdown Table mapping: Document Title, Core Methodology, Key Advantages, Main Limitations/Drawbacks).
2. DETAILED METHODOLOGICAL ANALYSIS: Compare the research approaches or techniques used in each document.
3. KEY ADVANTAGES & DISADVANTAGES: A detailed narrative comparison of pros and cons.
4. IMPLEMENTATION & PRACTICAL APPROACHES: Compare how each system is built, scaled, or validated.

Context retrieved from the documents:
{comparison_context}

Provide a detailed, objective comparison in markdown format using the structure above.
"""
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
            raise ValueError("No API keys found for LLM comparison.")

    def compare_documents(self, doc_ids: List[str], doc_names: List[str]) -> Dict[str, Any]:
        """Collects relevant content from each document and runs the comparative analysis."""
        logger.info(f"Comparing documents: {doc_ids} ('{doc_names}')")
        
        if len(doc_ids) < 2:
            return {
                "comparison": "Please select at least two documents for comparison."
            }
            
        # Collect key chunks from each document
        # We search for terms like "methodology", "architecture", "results", "conclusion" to get the most comparative segments
        search_terms = ["methodology", "architecture", "results", "conclusion", "proposal"]
        comparison_blocks = []
        
        for doc_id, doc_name in zip(doc_ids, doc_names):
            logger.info(f"Retrieving key comparative segments for: {doc_name}")
            
            # Retrieve chunks for this document matching comparison keywords
            matched_chunks = []
            seen_ids = set()
            
            for term in search_terms:
                res = self.vector_manager.semantic_search(term, doc_ids=[doc_id], k=2)
                for chunk in res:
                    if chunk["chunk_id"] not in seen_ids:
                        seen_ids.add(chunk["chunk_id"])
                        matched_chunks.append(chunk)
                        
            # Sort by page order
            matched_chunks = sorted(matched_chunks, key=lambda x: (x["page_number"], x["chunk_id"]))
            
            # Concat the key segments
            doc_context = ""
            for idx, c in enumerate(matched_chunks[:4]):  # Keep top 4 key segments
                doc_context += f"[Segment {idx+1} from Page {c['page_number']}]: {c['text']}\n\n"
                
            comparison_blocks.append(f"=== Document: {doc_name} (ID: {doc_id}) ===\n{doc_context}")
            
        comparison_context = "\n\n".join(comparison_blocks)
        
        try:
            comparison_markdown = self._call_llm_compare(comparison_context, doc_names)
            return {
                "comparison": comparison_markdown
            }
        except Exception as e:
            logger.warning(f"LLM Comparison failed: {str(e)}. Generating rule-based comparative summary.")
            
            # Offline rule-based comparative matrix fallback
            table_rows = []
            for doc_name, doc_id in zip(doc_names, doc_ids):
                chunks = self.vector_manager._get_all_chunks_for_docs([doc_id])
                p_count = max([c["page_number"] for c in chunks]) if chunks else 0
                c_count = len(chunks)
                
                table_rows.append(
                    f"| {doc_name} | Vector Index Retrieval | High search recall across {c_count} chunks | Requires API keys for detailed reasoning |"
                )
                
            matrix_fallback = f"""# Document Comparison Report
*(Offline Rule-Based Mock Analysis)*

This report provides a structural comparison of the uploaded files: {', '.join(doc_names)}.

## COMPARISON MATRIX

| Document Title | Core Methodology | Key Advantages | Main Limitations |
| --- | --- | --- | --- |
{chr(10).join(table_rows)}

## DETAILED METHODOLOGICAL ANALYSIS
* **Similarities**: All selected documents were successfully parsed, split using a recursive text splitter, and stored in a shared local vector workspace (`ChromaDB`).
* **Differences**: The files contain different keyword frequencies, indicating distinct technical focus domains (such as AI, Cloud Computing, or Security).

## KEY ADVANTAGES & DISADVANTAGES
* **Advantages**: Processing documents in this workspace makes them instantly searchable via dense cosine similarity.
* **Disadvantages**: To get full AI comparisons of their methodologies, you must configure a `GEMINI_API_KEY` or `OPENAI_API_KEY` in the project `.env` file.

## IMPLEMENTATION & PRACTICAL APPROACHES
1. **Document Loading**: PyPDF extracts text and maps page offsets.
2. **Retrieval**: System supports Hybrid search combining TF-IDF lexical matches and vector similarities.
3. **Storage**: SQLite manages document metadata, while ChromaDB persists text indices.
"""
            return {
                "comparison": matrix_fallback
            }
