import pytest
from src.ml.predictor import DocumentClassifier

def test_classifier_fallback():
    """Verifies that the DocumentClassifier correctly falls back to keyword mapping if models are not loaded."""
    classifier = DocumentClassifier(model_path="nonexistent.h5", tokenizer_path="nonexistent.pickle")
    
    # Test empty text
    assert classifier.predict_category("") == "Uncategorized"
    assert classifier.predict_category("   ") == "Uncategorized"
    
    # Test keyword matching predictions
    ai_text = "This paper discusses deep learning algorithms and convolutional neural networks for computer vision."
    sec_text = "Analysis of cyber security breaches and penetration testing across database firewalls."
    cloud_text = "Deploying serverless microservices and container orchestration using Kubernetes cluster nodes."
    robot_text = "We compute inverse kinematics trajectory paths for robotic manipulator controllers."
    db_text = "Optimizing PostgreSQL sql query execution plans and nosql sharding layouts."
    
    assert classifier.predict_category(ai_text) == "Artificial Intelligence"
    assert classifier.predict_category(sec_text) == "Cyber Security"
    assert classifier.predict_category(cloud_text) == "Cloud Computing"
    assert classifier.predict_category(robot_text) == "Robotics"
    assert classifier.predict_category(db_text) == "Databases & Data Engineering"
