from sqlalchemy import Column, String, Integer, DateTime, Text, Float, ForeignKey
from datetime import datetime
from src.database.base import Base

class User(Base):
    __tablename__ = "users"

    user_id = Column(String(50), primary_key=True, index=True)
    username = Column(String(100), unique=True, index=True, nullable=False)
    password_hash = Column(String(255), nullable=False)
    created_at = Column(DateTime, default=datetime.utcnow)

class DocumentMetadata(Base):
    __tablename__ = "document_metadata"

    doc_id = Column(String(50), primary_key=True, index=True)
    file_name = Column(String(255), nullable=False)
    upload_timestamp = Column(DateTime, default=datetime.utcnow)
    total_pages = Column(Integer, default=0)
    total_chunks = Column(Integer, default=0)
    processing_status = Column(String(50), default="PENDING")  # PENDING, PROCESSING, PROCESSED, FAILED
    category = Column(String(100), default="Uncategorized")
    file_path = Column(String(512), nullable=False)
    user_id = Column(String(50), ForeignKey("users.user_id"), nullable=True)

class ChatMessage(Base):
    __tablename__ = "chat_messages"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    session_id = Column(String(100), index=True, nullable=False)
    role = Column(String(50), nullable=False)  # user, assistant
    content = Column(Text, nullable=False)
    timestamp = Column(DateTime, default=datetime.utcnow)
    user_id = Column(String(50), ForeignKey("users.user_id"), nullable=True)

class QueryAnalytics(Base):
    __tablename__ = "query_analytics"

    id = Column(Integer, primary_key=True, index=True, autoincrement=True)
    timestamp = Column(DateTime, default=datetime.utcnow)
    query = Column(Text, nullable=False)
    response = Column(Text, nullable=False)
    latency_ms = Column(Float, default=0.0)
    referenced_docs = Column(Text, default="")  # JSON string of doc details
    user_id = Column(String(50), ForeignKey("users.user_id"), nullable=True)
