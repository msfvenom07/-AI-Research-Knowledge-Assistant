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
    
    # Database seeding for default user accounts
    from src.database.base import SessionLocal
    from src.database.models import User
    from src.database.auth import hash_password
    import uuid
    
    db = SessionLocal()
    try:
        # Seeding a default user so that the user can always log in with the same credentials,
        # even if the transient SQLite file resets on Render/cloud containers.
        default_username = os.environ.get("DEFAULT_USER_USERNAME", "raj")
        default_password = os.environ.get("DEFAULT_USER_PASSWORD", "password123")
        
        existing_user = db.query(User).filter(User.username == default_username).first()
        if not existing_user:
            logger.info(f"Seeding default user account: '{default_username}'...")
            new_user = User(
                user_id=str(uuid.uuid4()),
                username=default_username,
                password_hash=hash_password(default_password)
            )
            db.add(new_user)
            db.commit()
            logger.info(f"Successfully seeded default user '{default_username}' (pwd: '{default_password}').")
    except Exception as seed_err:
        logger.error(f"Failed to seed default user: {str(seed_err)}")
    finally:
        db.close()
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
    # Listen on port 8000 to match the Dockerfile EXPOSE 8000 instruction
    port = 8000
    logger.info(f"Starting uvicorn server on http://0.0.0.0:{port}...")
    # Disable reload in production Docker environments to optimize CPU and startup performance
    is_reload = os.environ.get("ENV", "production") == "development"
    uvicorn.run("main:app", host="0.0.0.0", port=port, reload=is_reload)
