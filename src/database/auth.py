import json
import base64
import hmac
import hashlib
import time
import secrets
import logging
from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from sqlalchemy.orm import Session
from config.settings import settings
from src.database.base import get_db
from src.database.models import User

logger = logging.getLogger(__name__)

# Fetch secret key from settings config
SECRET_KEY = settings.JWT_SECRET_KEY

oauth2_scheme = OAuth2PasswordBearer(tokenUrl="/auth/login", auto_error=False)

def hash_password(password: str) -> str:
    """Hashes a password using PBKDF2 with SHA-256."""
    salt = secrets.token_hex(16)
    pwd_hash = hashlib.pbkdf2_hmac(
        "sha256",
        password.encode("utf-8"),
        salt.encode("utf-8"),
        100000
    ).hex()
    return f"{salt}${pwd_hash}"

def verify_password(password: str, hashed_str: str) -> bool:
    """Verifies a password against its PBKDF2 hash."""
    try:
        salt, stored_hash = hashed_str.split("$")
        pwd_hash = hashlib.pbkdf2_hmac(
            "sha256",
            password.encode("utf-8"),
            salt.encode("utf-8"),
            100000
        ).hex()
        return secrets.compare_digest(stored_hash, pwd_hash)
    except Exception:
        return False

def base64url_encode(data: bytes) -> str:
    """Encodes bytes to base64url string."""
    return base64.urlsafe_b64encode(data).decode("utf-8").replace("=", "")

def base64url_decode(s: str) -> bytes:
    """Decodes a base64url string back to bytes."""
    padding = "=" * (4 - len(s) % 4)
    return base64.urlsafe_b64decode(s + padding)

def create_access_token(user_id: str, expires_in: int = 86400) -> str:
    """Creates a signed JWT-like token for a given user_id."""
    header = {"alg": "HS256", "typ": "JWT"}
    payload = {
        "user_id": user_id,
        "exp": int(time.time()) + expires_in
    }
    
    header_bytes = base64url_encode(json.dumps(header).encode("utf-8"))
    payload_bytes = base64url_encode(json.dumps(payload).encode("utf-8"))
    
    signing_input = f"{header_bytes}.{payload_bytes}".encode("utf-8")
    signature = hmac.new(SECRET_KEY.encode("utf-8"), signing_input, hashlib.sha256).digest()
    signature_bytes = base64url_encode(signature)
    
    return f"{header_bytes}.{payload_bytes}.{signature_bytes}"

def decode_access_token(token: str) -> dict:
    """Decodes and validates the signature and expiration of a token."""
    try:
        parts = token.split(".")
        if len(parts) != 3:
            return None
            
        header_bytes, payload_bytes, signature_bytes = parts
        
        # Verify signature
        signing_input = f"{header_bytes}.{payload_bytes}".encode("utf-8")
        expected_sig = hmac.new(SECRET_KEY.encode("utf-8"), signing_input, hashlib.sha256).digest()
        expected_sig_bytes = base64url_encode(expected_sig)
        
        if not secrets.compare_digest(signature_bytes, expected_sig_bytes):
            return None
            
        payload = json.loads(base64url_decode(payload_bytes).decode("utf-8"))
        if payload.get("exp", 0) < time.time():
            return None  # Token expired
            
        return payload
    except Exception:
        return None

def get_current_user(token: str = Depends(oauth2_scheme), db: Session = Depends(get_db)):
    """FastAPI dependency to extract and authorize the current user from headers."""
    if not token:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Not authenticated",
            headers={"WWW-Authenticate": "Bearer"},
        )
        
    payload = decode_access_token(token)
    if not payload:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="Could not validate credentials",
            headers={"WWW-Authenticate": "Bearer"},
        )
        
    user_id = payload.get("user_id")
    user = db.query(User).filter(User.user_id == user_id).first()
    if not user:
        raise HTTPException(
            status_code=status.HTTP_401_UNAUTHORIZED,
            detail="User not found",
            headers={"WWW-Authenticate": "Bearer"},
        )
        
    return user
