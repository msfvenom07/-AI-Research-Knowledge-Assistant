import os
from pydantic_settings import BaseSettings, SettingsConfigDict
from pydantic import Field

class Settings(BaseSettings):
    # App Paths
    VECTOR_DB_DIR: str = Field(default="./data/vector_db", validation_alias="VECTOR_DB_DIR")
    RAW_DOCS_DIR: str = Field(default="./data/raw_documents", validation_alias="RAW_DOCS_DIR")
    MODEL_PATH: str = Field(default="./models/tf_classifier.h5", validation_alias="MODEL_PATH")
    TOKENIZER_PATH: str = Field(default="./models/tokenizer.pickle", validation_alias="TOKENIZER_PATH")
    DB_URL: str = Field(default="sqlite:///./data/metadata.db", validation_alias="DB_URL")
    
    # LLM & Embedding Settings
    LLM_PROVIDER: str = Field(default="gemini", validation_alias="LLM_PROVIDER")  # gemini, openai, ollama
    EMBEDDING_PROVIDER: str = Field(default="huggingface", validation_alias="EMBEDDING_PROVIDER")  # huggingface, openai, gemini
    
    LLM_MODEL: str = Field(default="gemini-2.5-flash", validation_alias="LLM_MODEL")
    EMBEDDING_MODEL: str = Field(default="all-MiniLM-L6-v2", validation_alias="EMBEDDING_MODEL")
    
    # API Keys
    OPENAI_API_KEY: str = Field(default="", validation_alias="OPENAI_API_KEY")
    GEMINI_API_KEY: str = Field(default="", validation_alias="GEMINI_API_KEY")
    
    # Ollama Endpoints
    OLLAMA_BASE_URL: str = Field(default="http://localhost:11434", validation_alias="OLLAMA_BASE_URL")
    OLLAMA_LLM_MODEL: str = Field(default="llama3", validation_alias="OLLAMA_LLM_MODEL")

    # Security Keys
    JWT_SECRET_KEY: str = Field(default="enterprise-ai-research-secret-key-change-in-production", validation_alias="JWT_SECRET_KEY")

    model_config = SettingsConfigDict(
        env_file=".env",
        env_file_encoding="utf-8",
        extra="ignore"
    )

# Create folders if they don't exist
os.makedirs("./data/raw_documents", exist_ok=True)
os.makedirs("./data/vector_db", exist_ok=True)
os.makedirs("./data/dataset", exist_ok=True)
os.makedirs("./models", exist_ok=True)

settings = Settings()
