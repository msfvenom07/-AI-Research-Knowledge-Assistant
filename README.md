# AI Research & Knowledge Assistant

An enterprise-ready, production-grade AI Research & Knowledge Assistant designed to process, analyze, and query repositories of unstructured PDF documents (technical whitepapers, specification sheets, and academic journals). 

The system integrates an intelligent PDF parsing/chunking ingestion pipeline, a custom TensorFlow classifier to auto-categorize uploaded documents into technology domains, a SQLite database for metadata/conversational logs, a ChromaDB vector index supporting Dense Semantic, Sparse Keyword, and Hybrid RRF retrievals, a conversational RAG QA pipeline featuring conversation memory and page-level source citations, and an interactive dark-themed web dashboard.

---

## 1. System Architecture

The workflow of the application consists of two primary cycles: **Ingestion Pipeline** and **Query Retrieval (RAG)**:

```
[ PDF UPLOAD ]
      │
      ▼
┌──────────────┐      ┌──────────────────────────┐
│  PDF Parser  ├─────►│  TensorFlow Classifier  │ ──► Categorize and store
└──────┬───────┘      │     (models/tf_*.h5)     │     in Metadata DB
       │              └──────────────────────────┘
       ▼
┌──────────────┐
│ Text Chunker │ ──► Overlapping page-isolated segments (~1000 chars)
└──────┬───────┘
       │
       ▼
┌──────────────┐      ┌──────────────────────────┐
│  Embeddings  ├─────►│        ChromaDB          │
│    Engine    │      │  (Persistent Vector DB)  │
└──────────────┘      └────────────┬─────────────┘
                                   │
[ USER QUERY ]                     │
      │                            ▼
      │               ┌──────────────────────────┐
      ├──────────────►│   Hybrid Retrieval RFF   │ ──► Combines Semantic &
      │               │   (Dense + Sparse TFIDF) │     Keyword ranks
      │               └────────────┬─────────────┘
      ▼                            │
┌──────────────┐                   │
│   Memory     │                   ▼
│   Context    │      ┌──────────────────────────┐
│ (SQLite Logs)├─────►│   Citation Prompt LLM    │ ──► Final Citation-grounded
└──────────────┘      │ (Gemini/OpenAI/Ollama/   │     Answer + Highlights
                      │     Mock Fallback)       │
                      └──────────────────────────┘
```

---

## 2. Technology Stack

* **Backend Framework**: FastAPI (high-performance async REST APIs, automatic OpenAPI Swagger spec).
* **Database (Metadata & Session Logs)**: SQLite via SQLAlchemy.
* **Document Processing**: `pypdf` (extracts plain text page-by-page mapping page offsets).
* **Text Chunking**: LangChain recursive character splitter (supports overlap boundaries).
* **Vector Index**: `ChromaDB` (local embedded persistent vector DB).
* **Embeddings Model**: HuggingFace `sentence-transformers/all-MiniLM-L6-v2` running locally and free of charge, with optional OpenAI or Gemini embed API endpoints.
* **LLM Reasoning**: Supports Google Gemini (via `google-generativeai`), OpenAI GPT models, local Ollama (Llama-3/Mistral), or a local offline rules-based RAG matching engine.
* **Deep Learning Classifier**: Custom TensorFlow Sequential Neural Network (Embedding + GlobalAveragePooling1D + Dense + Dropout + Softmax) trained on a synthetic technical abstracts dataset.
* **Testing & Quality Assurance**: PyTest suite validating ML inference, parsing boundaries, and empty index fallback structures.
* **Frontend Dashboard**: Responsive single-page application using HTML, Tailwind CSS, FontAwesome, Chart.js, and Marked.js.

---

## 3. Project Directory Structure

```
c:\Users\User\Desktop\SSL\
│
├── config/
│   ├── __init__.py
│   └── settings.py              # Environment variables & app settings (Pydantic Settings)
│
├── data/
│   ├── raw_documents/           # Stored uploaded PDF files
│   ├── vector_db/               # Local persistence for Chroma vector index
│   └── dataset/                 # Training dataset logs
│
├── models/
│   ├── tf_classifier.h5         # Saved TensorFlow deep learning model
│   └── tokenizer.pickle         # Saved tokenizer pickle artifact
│
├── sample_docs/                 # High-quality generated test PDF files
│   ├── create_samples.py        # PDF generator script
│   ├── sample_artificial_intelligence.pdf
│   ├── sample_cyber_security.pdf
│   ├── sample_cloud_computing.pdf
│   └── sample_databases.pdf
│
├── src/
│   ├── __init__.py
│   ├── database/
│   │   ├── __init__.py
│   │   ├── base.py              # Database connection session setup
│   │   ├── models.py            # SQLite ORM models (Users, Metadata, Session logs, Query metrics)
│   │   └── auth.py              # Password hashing and token validation engine
│   │
│   ├── document_processing/
│   │   ├── __init__.py
│   │   ├── pdf_parser.py        # PDF text parser
│   │   └── chunker.py           # Page-isolated recursive characters text splitter
│   │
│   ├── ml/
│   │   ├── __init__.py
│   │   ├── dataset_prep.py      # Preprocessing & synthetic data builder
│   │   ├── train_classifier.py  # Model compilation, training, and serialization
│   │   └── predictor.py         # Classifier loading, inference wrapper, and fallback
│   │
│   ├── vector_store/
│   │   ├── __init__.py
│   │   └── manager.py           # ChromaDB manager: index, search (semantic, keyword, hybrid)
│   │
│   ├── rag/
│   │   ├── __init__.py
│   │   ├── qa_chain.py          # Grounded RAG with conversation memory and citations
│   │   ├── summarizer.py        # Multi-tier summarizer (Executive, Technical, Takeaways)
│   │   └── comparator.py        # Multi-document reviewer
│   │
│   └── analytics/
│       ├── __init__.py
│       └── metrics.py           # Queries and databases stats compiler
│
├── routes/
│   ├── __init__.py
│   ├── auth_routes.py           # Endpoints: user registration and logins
│   ├── document_routes.py       # Endpoints: upload, list, delete, reprocess documents
│   ├── search_routes.py         # Endpoints: hybrid retrieval, conversation chat QA
│   ├── analysis_routes.py       # Endpoints: summarize, compare, ML classify
│   └── analytics_routes.py      # Endpoints: aggregate system analytics
│
├── static/
│   └── index.html               # Premium single page dashboard frontend
│
├── tests/
│   ├── test_parser.py           # Tests page text extraction and text splits
│   ├── test_ml.py               # Tests ML predictions and fallbacks
│   └── test_rag.py              # Tests RAG grounding empty index warnings
│
├── .env                         # Local configuration settings (Pydantic source)
├── .env.example                 # Settings templates
├── main.py                      # FastAPI server entry point
├── README.md                    # Core documentation
└── requirements.txt             # Project library requirements
```

---

## 4. Setup & Running Instructions

### Prerequisites
Make sure Python `3.10` to `3.13` is installed on your system.

### Step 1: Install Dependencies
Open your shell in the root project folder (`c:\Users\User\Desktop\SSL`) and run:
```bash
pip install -r requirements.txt
```

### Step 2: Configure Environment Variables
Copy `.env.example` to a new file named `.env`:
```bash
cp .env.example .env
```
Open `.env` and configure your API keys if you plan to use cloud providers (e.g. OpenAI or Gemini). If they are left empty, the application will automatically run **fully locally and offline** using SentenceTransformers for embeddings and a rules-based extraction engine for RAG summaries, comparisons, and chat, avoiding any crash due to missing credentials.

* **LLM_PROVIDER**: `gemini` (default), `openai`, or `ollama`.
* **EMBEDDING_PROVIDER**: `huggingface` (default - local/free), `openai`, or `gemini`.

### Step 3: Run Model Training (Optional - Done during build)
To train the TensorFlow classifier on the synthetic training dataset:
```bash
python -m src.ml.train_classifier
```
This builds and saves the model to `models/tf_classifier.h5` and tokenizer to `models/tokenizer.pickle`. (This has been pre-run, and the model assets are fully serialized and present).

### Step 4: Launch the Server
Execute the main entry point:
```bash
python main.py
```
Uvicorn will start serving the application on:
```
http://localhost:8000
```

### Step 5: Run Automated Tests
To run the automated validation tests:
```bash
python -m pytest
```

---

## 5. API Reference

FastAPI automatically generates an interactive Swagger UI. Once the server is running, navigate to `http://localhost:8000/docs` to test endpoints interactively.

| Endpoint | Method | Description |
| --- | --- | --- |
| `/auth/register` | `POST` | Registers a new user account with hashed credentials. |
| `/auth/login` | `POST` | Verifies user credentials and returns signed access token. |
| `/documents/upload` | `POST` | Uploads one or more PDF documents (starts async parsing queue). |
| `/documents` | `GET` | Returns list of all user-indexed documents and status. |
| `/documents/{doc_id}` | `GET` | Retrieve metadata details for a specific user document. |
| `/documents/{doc_id}` | `DELETE` | Deletes file from disk, SQLite, and ChromaDB user indices. |
| `/documents/{doc_id}/reprocess` | `POST` | Reset status and trigger reprocessing on user file. |
| `/search/query` | `POST` | Query user-isolated vector DB (semantic, keyword, or hybrid). |
| `/search/qa` | `POST` | Ask question (RAG grounded QA with memory & citations). |
| `/search/qa/stream` | `POST` | Stream real-time answers (SSE tokens with citation payloads). |
| `/search/session/{session_id}`| `DELETE` | Clears conversation memory logs for a specific user session. |
| `/analysis/summarize` | `POST` | Generates a structured user document summary. |
| `/analysis/compare` | `POST` | Analyzes differences between multiple user documents. |
| `/analysis/classify` | `POST` | Input text sample to test TensorFlow domain predictions. |
| `/analytics` | `GET` | Returns user-isolated index stats, latency, and query logs. |

---

## 6. Design Decisions & Assumptions

* **Page-Isolated Chunking**: Instead of chunking the entire concatenated document, we chunk each page individually. This enforces a strict boundary condition where no chunk spans across page borders. Consequently, page-level citation highlights are guaranteed to be 100% accurate.
* **Offline Mock Fallbacks**: Because api keys are often restricted in sandbox environments, we implemented comprehensive rule-based local mock engines for RAG QA, Summarizer, and Comparator. If API keys are omitted in `.env`, the app detects this and swaps to offline fallback algorithms, ensuring full functionalities and citations are testable without external network dependencies.
* **Hybrid Search RRF**: Implemented Reciprocal Rank Fusion (RRF) to merge rankings from Semantic Cosine Similarity (dense representation) and TF-IDF Similarity (sparse lexical representation). This provides a balanced search retrieval that captures both structural keyword details and conceptual sentences.
* **SQLite for Conversational Log**: Storing chat logs directly inside the database allows the server to scale stateless sessions. It also makes it extremely easy to calculate analytics metrics.
