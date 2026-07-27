import pytest
from src.database.auth import hash_password, verify_password, create_access_token, decode_access_token
from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_password_hashing():
    """Tests password hashing and verification."""
    pwd = "super-secret-password"
    hashed = hash_password(pwd)
    
    assert hashed != pwd
    assert verify_password(pwd, hashed) is True
    assert verify_password("wrong-password", hashed) is False

def test_jwt_like_tokens():
    """Tests lightweight JWT signed token generation and decoding."""
    user_id = "test-user-123"
    token = create_access_token(user_id, expires_in=10)
    
    decoded = decode_access_token(token)
    assert decoded is not None
    assert decoded["user_id"] == user_id
    
    # Test expired or corrupted token
    assert decode_access_token("corrupted.token.value") is None

def test_auth_api_routes(db_session=None):
    """Tests registration and login API endpoints."""
    import uuid
    username = f"user_{uuid.uuid4().hex[:6]}"
    password = "testpassword"
    
    # 1. Test Register
    reg_response = client.post("/auth/register", json={
        "username": username,
        "password": password
    })
    assert reg_response.status_code == 201
    reg_data = reg_response.json()
    assert "user_id" in reg_data
    assert reg_data["username"] == username
    
    # 2. Test Register duplicate user (should fail)
    dup_response = client.post("/auth/register", json={
        "username": username,
        "password": password
    })
    assert dup_response.status_code == 400
    
    # 3. Test Login
    login_response = client.post("/auth/login", json={
        "username": username,
        "password": password
    })
    assert login_response.status_code == 200
    login_data = login_response.json()
    assert "access_token" in login_data
    assert login_data["username"] == username
    
    # 4. Test Login wrong password (should fail)
    bad_login = client.post("/auth/login", json={
        "username": username,
        "password": "wrongpassword"
    })
    assert bad_login.status_code == 401
