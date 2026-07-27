import logging
import re
import time
import json
from typing import List, Dict, Any, Optional
from config.settings import settings
from src.vector_store.manager import VectorStoreManager

logger = logging.getLogger(__name__)

class RAGQuestionAnswering:
    def __init__(self, vector_manager: Optional[VectorStoreManager] = None):
        self.vector_manager = vector_manager or VectorStoreManager()
        self.provider = settings.LLM_PROVIDER.lower()
        self.model_name = settings.LLM_MODEL

    def _call_gemini(self, prompt: str) -> str:
        """Invokes Gemini LLM."""
        if not settings.GEMINI_API_KEY:
            raise ValueError("GEMINI_API_KEY is not set in environment.")
            
        import google.generativeai as genai
        genai.configure(api_key=settings.GEMINI_API_KEY)
        
        model_name = self.model_name
        if "gpt" in model_name.lower():
            model_name = "gemini-2.5-flash"
            
        model = genai.GenerativeModel(model_name)
        response = model.generate_content(
            prompt,
            generation_config={"temperature": 0.0}
        )
        return response.text

    def _call_openai(self, prompt: str) -> str:
        """Invokes OpenAI LLM."""
        if not settings.OPENAI_API_KEY:
            raise ValueError("OPENAI_API_KEY is not set in environment.")
            
        from openai import OpenAI
        client = OpenAI(api_key=settings.OPENAI_API_KEY)
        
        model_name = self.model_name
        if "gemini" in model_name.lower():
            model_name = "gpt-4o"
            
        response = client.chat.completions.create(
            model=model_name,
            messages=[{"role": "user", "content": prompt}],
            temperature=0.0
        )
        return response.choices[0].message.content

    def _call_ollama(self, prompt: str) -> str:
        """Invokes Ollama local LLM."""
        import requests
        model_name = settings.OLLAMA_LLM_MODEL
        url = f"{settings.OLLAMA_BASE_URL}/api/generate"
        
        logger.info(f"Calling local Ollama model {model_name} at {url}...")
        response = requests.post(
            url,
            json={"model": model_name, "prompt": prompt, "stream": False},
            timeout=30
        )
        response.raise_for_status()
        return response.json()["response"]

    def _call_mock_llm(self, query: str, context_str: str, docs: List[Dict[str, Any]]) -> str:
        """
        A local, rule-based mock QA engine that extracts information from the retrieved context.
        Ensures the application functions fully (with source citations) even if no API keys are provided.
        """
        logger.info("Using local Mock RAG Engine (No API key found).")
        
        if not context_str.strip() or not docs:
            return "I cannot determine the answer from the provided documents."
            
        query_words = [w.lower() for w in re.findall(r'\b\w{4,}\b', query) if w.lower() not in ['what', 'where', 'when', 'how', 'who', 'paper', 'document', 'system', 'research', 'explain']]
        
        best_sentence = ""
        best_doc_name = docs[0]["doc_id"]
        best_page = docs[0]["page_number"]
        max_matches = 0
        
        for d in docs:
            text = d["text"]
            sentences = re.split(r'(?<=[.!?])\s+', text)
            for sentence in sentences:
                matches = sum(1 for word in query_words if word in sentence.lower())
                if matches > max_matches:
                    max_matches = matches
                    best_sentence = sentence
                    best_doc_name = d.get("file_name", d["doc_id"])
                    best_page = d["page_number"]
                    
        if max_matches > 0:
            ans = f"[Local Model Run (Offline Fallback)] Based on the retrieved context: \"{best_sentence}\"\n\nCitations: [{best_doc_name}, Page {best_page}]"
            return ans
            
        top_chunk = docs[0]
        doc_name = top_chunk.get("file_name", top_chunk["doc_id"])
        page_no = top_chunk["page_number"]
        
        return (
            f"[Local Model Run (Offline Fallback)] I found relevant context in the uploaded documents, but could not isolate a precise sentence matching your search. "
            f"Here is the most relevant passage from the document:\n\n"
            f"\"{top_chunk['text'][:300]}...\"\n\n"
            f"Reference: [{doc_name}, Page {page_no}]"
        )

    def answer_question(
        self, 
        query: str, 
        user_id: str,
        doc_ids: Optional[List[str]] = None, 
        search_mode: str = "hybrid", 
        chat_history: List[Dict[str, str]] = []
    ) -> Dict[str, Any]:
        """
        Retrieves context, constructs prompt, calls LLM (or mock fallback), 
        and extracts structured citation metadata.
        """
        start_time = time.time()
        k = 4
        
        if search_mode == "semantic":
            docs = self.vector_manager.semantic_search(query, user_id=user_id, doc_ids=doc_ids, k=k)
        elif search_mode == "keyword":
            docs = self.vector_manager.keyword_search(query, user_id=user_id, doc_ids=doc_ids, k=k)
        else:  # hybrid
            docs = self.vector_manager.hybrid_search(query, user_id=user_id, doc_ids=doc_ids, k=k)
            
        context_blocks = []
        citations = []
        
        for d in docs:
            doc_name = d.get("file_name", d["doc_id"])
            page_no = d["page_number"]
            context_blocks.append(f"--- Source: {doc_name} (Page {page_no}) ---\n{d['text']}")
            citations.append({
                "document": doc_name,
                "doc_id": d["doc_id"],
                "page": page_no
            })
            
        context_str = "\n\n".join(context_blocks)
        
        history_str = ""
        for h in chat_history[-5:]:
            role = "User" if h["role"] == "user" else "Assistant"
            history_str += f"{role}: {h['content']}\n"
            
        prompt_template = """You are an AI Research Assistant. Answer the user's question using ONLY the provided document context below. 
If the context does not contain sufficient information to answer the question, state clearly: "I cannot determine the answer from the provided documents."
Do not make assumptions or extrapolate beyond the provided text.

For every statement or fact you state, you MUST cite the source document name and page number inside square brackets, e.g., [filename.pdf, Page 3]. Keep citations clean and exact.

Conversation History:
{history}

Context:
{context}

Question: {question}

Answer:"""

        prompt = prompt_template.format(
            history=history_str if history_str else "No prior history.",
            context=context_str if context_str else "No context available.",
            question=query
        )
        
        answer_text = ""
        has_api_keys = (self.provider == "gemini" and settings.GEMINI_API_KEY) or \
                       (self.provider == "openai" and settings.OPENAI_API_KEY)
                       
        if self.provider == "ollama":
            try:
                answer_text = self._call_ollama(prompt)
            except Exception as e:
                logger.error(f"Ollama call failed: {str(e)}. Falling back to local rules.")
                answer_text = self._call_mock_llm(query, context_str, docs)
        elif has_api_keys:
            try:
                if self.provider == "openai":
                    answer_text = self._call_openai(prompt)
                else:  # gemini
                    answer_text = self._call_gemini(prompt)
            except Exception as e:
                logger.error(f"{self.provider} LLM execution failed: {str(e)}. Falling back to local rules.")
                answer_text = f"Error calling {self.provider} API: {str(e)}.\n\n" + self._call_mock_llm(query, context_str, docs)
        else:
            answer_text = self._call_mock_llm(query, context_str, docs)
            
        extracted_citations = []
        found_matches = re.findall(r'\[([^\]]+)\]', answer_text)
        
        unique_citation_keys = set()
        for match in found_matches:
            parts = match.split(',')
            if len(parts) >= 2 and 'page' in parts[1].lower():
                doc_name = parts[0].strip()
                page_part = parts[1].strip()
                page_match = re.search(r'\d+', page_part)
                page_no = int(page_match.group()) if page_match else 0
                
                citation_key = f"{doc_name}_{page_no}"
                if citation_key not in unique_citation_keys:
                    unique_citation_keys.add(citation_key)
                    extracted_citations.append({
                        "document": doc_name,
                        "page": page_no
                    })
                    
        if not extracted_citations and docs:
            seen_c = set()
            for d in docs[:2]:
                doc_name = d.get("file_name", d["doc_id"])
                c_key = f"{doc_name}_{d['page_number']}"
                if c_key not in seen_c:
                    seen_c.add(c_key)
                    extracted_citations.append({
                        "document": doc_name,
                        "page": d["page_number"]
                    })
                    
        latency_ms = (time.time() - start_time) * 1000
        
        return {
            "answer": answer_text,
            "citations": extracted_citations,
            "retrieved_context": [d["text"] for d in docs],
            "latency_ms": latency_ms
        }

    def answer_question_stream(
        self, 
        query: str, 
        user_id: str,
        doc_ids: Optional[List[str]] = None, 
        search_mode: str = "hybrid", 
        chat_history: List[Dict[str, str]] = []
    ):
        """
        Retrieves context and yields answer chunks progressively using Server-Sent Events (SSE) formatting.
        First yields metadata (citations).
        """
        k = 4
        if search_mode == "semantic":
            docs = self.vector_manager.semantic_search(query, user_id=user_id, doc_ids=doc_ids, k=k)
        elif search_mode == "keyword":
            docs = self.vector_manager.keyword_search(query, user_id=user_id, doc_ids=doc_ids, k=k)
        else:  # hybrid
            docs = self.vector_manager.hybrid_search(query, user_id=user_id, doc_ids=doc_ids, k=k)
            
        context_blocks = []
        citations = []
        for d in docs:
            doc_name = d.get("file_name", d["doc_id"])
            page_no = d["page_number"]
            context_blocks.append(f"--- Source: {doc_name} (Page {page_no}) ---\n{d['text']}")
            citations.append({
                "document": doc_name,
                "page": page_no
            })
            
        context_str = "\n\n".join(context_blocks)
        
        history_str = ""
        for h in chat_history[-5:]:
            role = "User" if h["role"] == "user" else "Assistant"
            history_str += f"{role}: {h['content']}\n"
            
        prompt_template = """You are an AI Research Assistant. Answer the user's question using ONLY the provided document context below. 
If the context does not contain sufficient information to answer the question, state clearly: "I cannot determine the answer from the provided documents."
Do not make assumptions or extrapolate beyond the provided text.

For every statement or fact you state, you MUST cite the source document name and page number inside square brackets, e.g., [filename.pdf, Page 3]. Keep citations clean and exact.

Conversation History:
{history}

Context:
{context}

Question: {question}

Answer:"""

        prompt = prompt_template.format(
            history=history_str if history_str else "No prior history.",
            context=context_str if context_str else "No context available.",
            question=query
        )
        
        # 1. Yield citations metadata first so the client has immediate access to references
        yield f"metadata:{json.dumps({'citations': citations})}\n"
        
        has_api_keys = (self.provider == "gemini" and settings.GEMINI_API_KEY) or \
                       (self.provider == "openai" and settings.OPENAI_API_KEY)
                       
        if self.provider == "openai" and has_api_keys:
            from openai import OpenAI
            client = OpenAI(api_key=settings.OPENAI_API_KEY)
            model_name = self.model_name
            if "gemini" in model_name.lower():
                model_name = "gpt-4o"
                
            try:
                stream = client.chat.completions.create(
                    model=model_name,
                    messages=[{"role": "user", "content": prompt}],
                    temperature=0.0,
                    stream=True
                )
                for chunk in stream:
                    content = chunk.choices[0].delta.content
                    if content:
                        yield f"content:{content}\n"
            except Exception as e:
                yield f"content:Error calling OpenAI API: {str(e)}\n"
                
        elif self.provider == "gemini" and has_api_keys:
            import google.generativeai as genai
            genai.configure(api_key=settings.GEMINI_API_KEY)
            model_name = self.model_name
            if "gpt" in model_name.lower():
                model_name = "gemini-2.5-flash"
                
            try:
                model = genai.GenerativeModel(model_name)
                response = model.generate_content_stream(
                    prompt,
                    generation_config={"temperature": 0.0}
                )
                for chunk in response:
                    if chunk.text:
                        yield f"content:{chunk.text}\n"
            except Exception as e:
                yield f"content:Error calling Gemini API: {str(e)}\n"
                
        elif self.provider == "ollama":
            import requests
            model_name = settings.OLLAMA_LLM_MODEL
            url = f"{settings.OLLAMA_BASE_URL}/api/generate"
            try:
                r = requests.post(
                    url,
                    json={"model": model_name, "prompt": prompt, "stream": True},
                    stream=True,
                    timeout=30
                )
                r.raise_for_status()
                for line in r.iter_lines():
                    if line:
                        chunk_data = json.loads(line.decode("utf-8"))
                        yield f"content:{chunk_data.get('response', '')}\n"
            except Exception as e:
                yield f"content:Error calling Ollama API: {str(e)}\n"
                
        else:
            # Simulate streaming words for Mock LLM (Rule-based Fallback)
            try:
                mock_ans = self._call_mock_llm(query, context_str, docs)
                # Split text into single words and stream them
                words = mock_ans.split(" ")
                for i, word in enumerate(words):
                    space = " " if i < len(words) - 1 else ""
                    yield f"content:{word}{space}\n"
                    time.sleep(0.04)  # 40ms simulation delay
            except Exception as e:
                yield f"content:Error running local mock: {str(e)}\n"
