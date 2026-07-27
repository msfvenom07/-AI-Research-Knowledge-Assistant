import uuid
from fastapi import APIRouter, Depends, HTTPException, status
from pydantic import BaseModel, Field
from sqlalchemy.orm import Session
from src.database.base import get_db
from src.database.models import User
from src.database.auth import hash_password, verify_password, create_access_token

router = APIRouter(prefix="/auth", tags=["User Authentication"])

class AuthRequest(BaseModel):
    username: str = Field(..., min_length=3, max_length=100)
    password: str = Field(..., min_length=4)

class TokenResponse(BaseModel):
    access_token: str
    token_type: str
    username: str
    user_id: str

@router.post("/register", status_code=status.HTTP_201_CREATED)
def register_user(request: AuthRequest, db: Session = Depends(get_db)):
    """Registers a new user account with hashed password credentials."""
    # Check if username already exists
    existing_user = db.query(User).filter(User.username == request.username).first()
    if existing_user:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Username already taken"
        )
        
    user_id = str(uuid.uuid4())
    hashed_pwd = hash_password(request.password)
    
    new_user = User(
        user_id=user_id,
        username=request.username,
        password_hash=hashed_pwd
    )
    db.add(new_user)
    db.commit()
    db.refresh(new_user)
    
    return {
        "message": "User registered successfully",
        "user_id": user_id,
        "username": request.username
    }

@router.post("/login", response_model=TokenResponse)
def login_user(request: AuthRequest, db: Session = Depends(get_db)):
    """Authenticates user credentials and returns a signed access token."""
    user = db.query(User).filter(User.username == request.username).first()
    if not user or not verify_password(request.password, user.password_hash):
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Invalid username or password"
        )
        
    token = create_access_token(user.user_id)
    return {
        "access_token": token,
        "token_type": "bearer",
        "username": user.username,
        "user_id": user.user_id
    }
