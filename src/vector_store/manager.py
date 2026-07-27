import os
import logging
from typing import List, Dict, Any, Optional
import numpy as np
from sklearn.feature_extraction.text import CountVectorizer
import chromadb
from config.settings import settings

logger = logging.getLogger(__name__)

class EmbeddingEngine:
    """Handles generating embeddings using HuggingFace, OpenAI, or Gemini."""
    def __init__(self):
        self.provider = settings.EMBEDDING_PROVIDER.lower()
        self.model_name = settings.EMBEDDING_MODEL
        self._hf_model = None
        self._openai_client = None
        
        logger.info(f"Initializing EmbeddingEngine with provider={self.provider}")
        
    def _get_hf_model(self):
        if self._hf_model is None:
            # Lazy load SentenceTransformer to save memory and startup time
            from sentence_transformers import SentenceTransformer
            logger.info("Loading SentenceTransformer model locally...")
            self._hf_model = SentenceTransformer(self.model_name)
        return self._hf_model

    def _get_openai_client(self):
        if self._openai_client is None:
            from openai import OpenAI
            self._openai_client = OpenAI(api_key=settings.OPENAI_API_KEY)
        return self._openai_client

    def get_embeddings(self, texts: List[str]) -> List[List[float]]:
        """Generates list of embeddings for list of input texts."""
        if not texts:
            return []
            
        if self.provider == "huggingface":
            model = self._get_hf_model()
            embeddings = model.encode(texts, show_progress_bar=False)
            return embeddings.tolist()
            
        elif self.provider == "openai":
            client = self._get_openai_client()
            response = client.embeddings.create(
                model=self.model_name if self.model_name != "all-MiniLM-L6-v2" else "text-embedding-3-small",
                input=texts
            )
            return [data.embedding for data in response.data]
            
        elif self.provider == "gemini":
            import google.generativeai as genai
            genai.configure(api_key=settings.GEMINI_API_KEY)
            
            model_path = f"models/{self.model_name}" if not self.model_name.startswith("models/") else self.model_name
            if "MiniLM" in model_path:
                model_path = "models/text-embedding-004"
                
            embeddings = []
            for text in texts:
                result = genai.embed_content(
                    model=model_path,
                    contents=text
                )
                embeddings.append(result['embedding'])
            return embeddings
            
        else:
            raise ValueError(f"Unknown embedding provider: {self.provider}")

    def get_query_embedding(self, query: str) -> List[float]:
        """Generates a single embedding for a query string."""
        return self.get_embeddings([query])[0]


class BM25Retriever:
    """Zero-dependency local Okapi BM25 ranking algorithm based on scikit-learn term frequencies."""
    def __init__(self, b: float = 0.75, k1: float = 1.5):
        self.b = b
        self.k1 = k1
        self.vectorizer = CountVectorizer(stop_words='english')
        self.doc_len = None
        self.avg_doc_len = 0
        self.tf = None
        self.idf = {}
        self.doc_count = 0
        self.vocab = {}

    def fit(self, corpus: List[str]):
        """Fits term statistics and document frequencies on the retrieval corpus."""
        self.doc_count = len(corpus)
        if self.doc_count == 0:
            return
            
        tf_matrix = self.vectorizer.fit_transform(corpus)
        self.vocab = self.vectorizer.vocabulary_
        self.tf = tf_matrix.toarray()
        
        # doc lengths
        self.doc_len = np.array(tf_matrix.sum(axis=1)).flatten()
        self.avg_doc_len = self.doc_len.mean() if len(self.doc_len) > 0 else 0
        
        # Calculate IDF with smoothing
        for term, index in self.vocab.items():
            n_q = np.sum(self.tf[:, index] > 0)
            self.idf[term] = np.log(1.0 + (self.doc_count - n_q + 0.5) / (n_q + 0.5))

    def score(self, query: str) -> np.ndarray:
        """Returns BM25 scores for all corpus documents against the query."""
        if self.doc_count == 0:
            return np.zeros(0)
            
        # Parse query using CountVectorizer's built-in analyzer
        try:
            query_words = [w.lower() for w in self.vectorizer.build_analyzer()(query)]
        except Exception:
            # Fallback to simple split if analyzer fails
            query_words = [w.lower() for w in query.split() if len(w) > 2]
            
        scores = np.zeros(self.doc_count)
        
        for word in query_words:
            if word not in self.vocab:
                continue
            index = self.vocab[word]
            idf_val = self.idf.get(word, 0.0)
            
            tf_term = self.tf[:, index]
            # Formula: IDF * (TF * (k1 + 1)) / (TF + k1 * (1 - b + b * (doc_len / avg_doc_len)))
            denom = tf_term + self.k1 * (1.0 - self.b + self.b * (self.doc_len / self.avg_doc_len))
            scores += idf_val * (tf_term * (self.k1 + 1.0)) / denom
            
        return scores


class RerankerEngine:
    """Re-ranks retrieved candidates using a local sentence-transformer Cross-Encoder model."""
    def __init__(self):
        self.model_name = "cross-encoder/ms-marco-MiniLM-L-6-v2"
        self._model = None
        self.is_active = False
        
    def _load_model(self):
        if self._model is None:
            try:
                from sentence_transformers import CrossEncoder
                logger.info(f"Loading CrossEncoder '{self.model_name}'...")
                self._model = CrossEncoder(self.model_name)
                self.is_active = True
                logger.info("CrossEncoder successfully loaded.")
            except Exception as e:
                logger.warning(f"Could not load CrossEncoder: {str(e)}. Using fallback RAG sorting.")
                self.is_active = False
        return self._model

    def rerank(self, query: str, candidates: List[Dict[str, Any]], k: int = 4) -> List[Dict[str, Any]]:
        """Re-ranks a list of chunk candidates and returns the top k results."""
        if not candidates:
            return []
            
        model = self._load_model()
        if self.is_active and model is not None:
            try:
                pairs = [[query, c["text"]] for c in candidates]
                scores = model.predict(pairs)
                
                for idx, score in enumerate(scores):
                    candidates[idx]["score"] = float(score)
                    
                return sorted(candidates, key=lambda x: x["score"], reverse=True)[:k]
            except Exception as e:
                logger.error(f"Error during CrossEncoder execution: {str(e)}")
                
        # Fallback ranking (keep original RRF order)
        return sorted(candidates, key=lambda x: x["score"], reverse=True)[:k]


class VectorStoreManager:
    """Manages indexing, user-isolated storage, and dense/hybrid retrieval using ChromaDB and BM25."""
    def __init__(self):
        self.db_dir = settings.VECTOR_DB_DIR
        os.makedirs(self.db_dir, exist_ok=True)
        
        logger.info(f"Initializing ChromaDB client at {self.db_dir}")
        self.client = chromadb.PersistentClient(path=self.db_dir)
        self.collection = self.client.get_or_create_collection("document_chunks")
        
        self.embed_engine = EmbeddingEngine()
        self.reranker = RerankerEngine()

    def add_chunks(self, chunks: List[Dict[str, Any]]):
        """Indexes text chunks with user_id metadata into ChromaDB."""
        if not chunks:
            return
            
        texts = [c["text"] for c in chunks]
        logger.info(f"Generating embeddings for {len(chunks)} chunks...")
        embeddings = self.embed_engine.get_embeddings(texts)
        
        ids = [c["chunk_id"] for c in chunks]
        metadatas = [{
            "doc_id": c["doc_id"], 
            "page_number": c["page_number"],
            "user_id": c.get("user_id", "")
        } for c in chunks]
        
        self.collection.add(
            ids=ids,
            embeddings=embeddings,
            documents=texts,
            metadatas=metadatas
        )
        logger.info("Successfully added chunks to ChromaDB.")

    def delete_document_chunks(self, doc_id: str):
        """Deletes all chunks associated with a specific doc_id."""
        logger.info(f"Deleting ChromaDB chunks for doc_id: {doc_id}")
        try:
            self.collection.delete(where={"doc_id": doc_id})
        except Exception as e:
            logger.error(f"Error deleting chunks for doc_id {doc_id}: {str(e)}")

    def _get_all_chunks_for_docs(self, user_id: str, doc_ids: Optional[List[str]] = None) -> List[Dict[str, Any]]:
        """Retrieves user-isolated raw texts and metadata from ChromaDB."""
        # Enforce user isolation in Chroma query
        where_clause = {"user_id": user_id}
        
        if doc_ids:
            if len(doc_ids) == 1:
                where_clause = {"$and": [{"user_id": user_id}, {"doc_id": doc_ids[0]}]}
            else:
                where_clause = {"$and": [{"user_id": user_id}, {"doc_id": {"$in": doc_ids}}]}
                
        res = self.collection.get(where=where_clause, include=["documents", "metadatas"])
        chunks_list = []
        if res and res["ids"]:
            for idx, cid in enumerate(res["ids"]):
                chunks_list.append({
                    "chunk_id": cid,
                    "text": res["documents"][idx],
                    "doc_id": res["metadatas"][idx]["doc_id"],
                    "page_number": res["metadatas"][idx]["page_number"]
                })
        return chunks_list

    def semantic_search(self, query: str, user_id: str, doc_ids: Optional[List[str]] = None, k: int = 4) -> List[Dict[str, Any]]:
        """Dense vector similarity search with user metadata filtering."""
        logger.info(f"Performing semantic search for user: {user_id}")
        query_vector = self.embed_engine.get_query_embedding(query)
        
        where_clause = {"user_id": user_id}
        if doc_ids:
            if len(doc_ids) == 1:
                where_clause = {"$and": [{"user_id": user_id}, {"doc_id": doc_ids[0]}]}
            else:
                where_clause = {"$and": [{"user_id": user_id}, {"doc_id": {"$in": doc_ids}}]}
                
        results = self.collection.query(
            query_embeddings=[query_vector],
            n_results=k,
            where=where_clause,
            include=["documents", "metadatas", "distances"]
        )
        
        search_results = []
        if results and results["ids"] and results["ids"][0]:
            for idx in range(len(results["ids"][0])):
                dist = results["distances"][0][idx]
                sim_score = 1.0 - dist if dist <= 1.0 else 1.0 / (1.0 + dist)
                
                search_results.append({
                    "chunk_id": results["ids"][0][idx],
                    "text": results["documents"][0][idx],
                    "doc_id": results["metadatas"][0][idx]["doc_id"],
                    "page_number": results["metadatas"][0][idx]["page_number"],
                    "score": float(sim_score)
                })
                
        return search_results

    def keyword_search(self, query: str, user_id: str, doc_ids: Optional[List[str]] = None, k: int = 4) -> List[Dict[str, Any]]:
        """Sparse BM25 similarity search over user-owned chunks."""
        logger.info(f"Performing BM25 search for user: {user_id}")
        
        chunks = self._get_all_chunks_for_docs(user_id, doc_ids)
        if not chunks:
            return []
            
        corpus = [c["text"] for c in chunks]
        bm25 = BM25Retriever()
        try:
            bm25.fit(corpus)
            scores = bm25.score(query)
            
            search_results = []
            for idx, score in enumerate(scores):
                if score > 0:
                    chunk = chunks[idx]
                    search_results.append({
                        "chunk_id": chunk["chunk_id"],
                        "text": chunk["text"],
                        "doc_id": chunk["doc_id"],
                        "page_number": chunk["page_number"],
                        "score": float(score)
                    })
                    
            # Sort by score descending
            return sorted(search_results, key=lambda x: x["score"], reverse=True)[:k]
        except Exception as e:
            logger.error(f"Error in BM25 execution: {str(e)}")
            return [{"chunk_id": c["chunk_id"], "text": c["text"], "doc_id": c["doc_id"], "page_number": c["page_number"], "score": 0.5} for c in chunks[:k]]

    def hybrid_search(self, query: str, user_id: str, doc_ids: Optional[List[str]] = None, k: int = 4) -> List[Dict[str, Any]]:
        """Combines semantic and BM25 retrievals via Reciprocal Rank Fusion (RRF), followed by Cross-Encoder reranking."""
        logger.info(f"Performing hybrid search + reranking for user: {user_id}")
        
        # 1. Retrieve candidates using k*3 to feed the reranker
        semantic_results = self.semantic_search(query, user_id, doc_ids, k=k*3)
        keyword_results = self.keyword_search(query, user_id, doc_ids, k=k*3)
        
        rrf_scores = {}
        chunk_lookup = {}
        
        # RRF formula: RRF_score = sum( 1 / (60 + rank) )
        for rank, res in enumerate(semantic_results):
            cid = res["chunk_id"]
            chunk_lookup[cid] = res
            rrf_scores[cid] = rrf_scores.get(cid, 0.0) + (1.0 / (60.0 + rank + 1))
            
        for rank, res in enumerate(keyword_results):
            cid = res["chunk_id"]
            chunk_lookup[cid] = res
            rrf_scores[cid] = rrf_scores.get(cid, 0.0) + (1.0 / (60.0 + rank + 1))
            
        # Extract top k*2 candidates for reranking
        sorted_ids = sorted(rrf_scores.keys(), key=lambda x: rrf_scores[x], reverse=True)[:k*2]
        
        fused_candidates = []
        for cid in sorted_ids:
            chunk = chunk_lookup[cid]
            chunk["score"] = float(rrf_scores[cid])
            fused_candidates.append(chunk)
            
        # 2. Run Cross-Encoder reranking
        reranked = self.reranker.rerank(query, fused_candidates, k=k)
        return reranked
