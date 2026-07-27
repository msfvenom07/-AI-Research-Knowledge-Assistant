import logging
import os
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import FileResponse
from fastapi.staticfiles import StaticFiles
import uvicorn

# Import configurations
from config.settings import settings
from src.database.base import engine, Base
# Import all database models to ensure metadata registrations are complete
import src.database.models as db_models

# Import routers
from routes import document_routes, search_routes, analysis_routes, analytics_routes, auth_routes

# Configure logging format and level
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
    handlers=[
        logging.StreamHandler()
    ]
)
logger = logging.getLogger(__name__)

# Create database tables if they do not exist
logger.info("Initializing metadata database schemas...")
try:
    Base.metadata.create_all(bind=engine)
    logger.info("Database schemas successfully loaded.")
except Exception as e:
    logger.error(f"Failed to create database schemas: {str(e)}")

# Initialize FastAPI App
app = FastAPI(
    title="AI Research & Knowledge Assistant API",
    description="Production-grade API endpoints for PDF parsing, semantic search, hybrid retrieval, and ML document categorization.",
    version="1.0.0"
)

# CORS Policy configuration
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Register routes
app.include_router(auth_routes.router)
app.include_router(document_routes.router)
app.include_router(search_routes.router)
app.include_router(analysis_routes.router)
app.include_router(analytics_routes.router)

# Mount static folder
os.makedirs("static", exist_ok=True)
app.mount("/static", StaticFiles(directory="static"), name="static")

# Serve Frontend at Root Route
@app.get("/")
def serve_frontend():
    """Serves the primary user interface dashboard."""
    index_path = os.path.join("static", "index.html")
    if os.path.exists(index_path):
        return FileResponse(index_path)
    return {"message": "AI Research & Knowledge Assistant Backend is running. Frontend file static/index.html is missing."}

if __name__ == "__main__":
    # Render binds services dynamically via the PORT environment variable
    port = int(os.environ.get("PORT", 8000))
    logger.info(f"Starting uvicorn server on http://0.0.0.0:{port}...")
    # Disable reload in production Docker environments to optimize CPU and startup performance
    is_reload = os.environ.get("ENV", "production") == "development"
    uvicorn.run("main:app", host="0.0.0.0", port=port, reload=is_reload)
