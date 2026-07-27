import logging
from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from src.database.base import get_db
from src.database.models import User
from src.database.auth import get_current_user
from src.analytics.metrics import AnalyticsEngine

logger = logging.getLogger(__name__)
router = APIRouter(prefix="/analytics", tags=["System Analytics"])

@router.get("")
def get_system_analytics(
    current_user: User = Depends(get_current_user),
    db: Session = Depends(get_db)
):
    """Computes and returns database statistics, processing metadata, and search queries popularity for the authenticated user."""
    stats = AnalyticsEngine.get_system_stats(db, user_id=current_user.user_id)
    return stats
