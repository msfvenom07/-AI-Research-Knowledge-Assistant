import json
import logging
from collections import Counter
from typing import Dict, Any, List
from sqlalchemy.orm import Session
from sqlalchemy import func
from src.database.models import DocumentMetadata, QueryAnalytics

logger = logging.getLogger(__name__)

class AnalyticsEngine:
    @staticmethod
    def get_system_stats(db: Session, user_id: str) -> Dict[str, Any]:
        """Calculates user-isolated analytics of the knowledge base and usage history."""
        logger.info(f"Calculating system analytics metrics for user: {user_id}...")
        
        try:
            # Helper query to filter by user_id
            doc_query = db.query(DocumentMetadata).filter(DocumentMetadata.user_id == user_id)
            query_anal_query = db.query(QueryAnalytics).filter(QueryAnalytics.user_id == user_id)
            
            # 1. Document counts and statuses
            total_docs = doc_query.count()
            processed_docs = doc_query.filter(DocumentMetadata.processing_status == "PROCESSED").count()
            failed_docs = doc_query.filter(DocumentMetadata.processing_status == "FAILED").count()
            processing_docs = doc_query.filter(DocumentMetadata.processing_status == "PROCESSING").count()
            pending_docs = doc_query.filter(DocumentMetadata.processing_status == "PENDING").count()
            
            # 2. Chunk counts
            total_chunks = db.query(func.sum(DocumentMetadata.total_chunks)).filter(DocumentMetadata.user_id == user_id).scalar() or 0
            
            # 3. Category distribution (TensorFlow predictions)
            category_counts = db.query(DocumentMetadata.category, func.count(DocumentMetadata.doc_id))\
                .filter(DocumentMetadata.user_id == user_id)\
                .group_by(DocumentMetadata.category).all()
            category_distribution = {cat: count for cat, count in category_counts}
            
            # 4. Query stats
            total_queries = query_anal_query.count()
            
            # 5. Average latency
            avg_latency = db.query(func.avg(QueryAnalytics.latency_ms)).filter(QueryAnalytics.user_id == user_id).scalar() or 0.0
            
            # 6. Top queried documents calculation
            all_queries = query_anal_query.filter(QueryAnalytics.referenced_docs != "").all()
            
            doc_query_counter = Counter()
            for query_record in all_queries:
                ref_docs_str = query_record.referenced_docs
                if not ref_docs_str:
                    continue
                try:
                    ref_list = json.loads(ref_docs_str)
                    for doc_info in ref_list:
                        doc_key = doc_info.get("file_name", doc_info.get("doc_id", "Unknown"))
                        doc_query_counter[doc_key] += 1
                except Exception as e:
                    for item in ref_docs_str.split(","):
                        item_clean = item.strip()
                        if item_clean:
                            doc_query_counter[item_clean] += 1
            
            top_queried = [
                {"document_name": doc, "query_count": count} 
                for doc, count in doc_query_counter.most_common(5)
            ]
            
            stats = {
                "total_documents": total_docs,
                "processed_documents": processed_docs,
                "failed_documents": failed_docs,
                "processing_documents": processing_docs,
                "pending_documents": pending_docs,
                "total_chunks": int(total_chunks),
                "total_embeddings_generated": int(total_chunks),
                "category_distribution": category_distribution,
                "total_questions_answered": total_queries,
                "average_latency_ms": round(float(avg_latency), 2),
                "top_queried_documents": top_queried
            }
            
            logger.info("System analytics successfully compiled.")
            return stats
            
        except Exception as e:
            logger.error(f"Error compiling system metrics: {str(e)}")
            return {
                "total_documents": 0,
                "processed_documents": 0,
                "failed_documents": 0,
                "processing_documents": 0,
                "pending_documents": 0,
                "total_chunks": 0,
                "total_embeddings_generated": 0,
                "category_distribution": {},
                "total_questions_answered": 0,
                "average_latency_ms": 0.0,
                "top_queried_documents": []
            }
