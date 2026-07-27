import os
import pickle
import logging
import numpy as np
from typing import Optional
from tensorflow.keras.preprocessing.sequence import pad_sequences
from config.settings import settings
from src.ml.dataset_prep import CATEGORIES

logger = logging.getLogger(__name__)

class DocumentClassifier:
    def __init__(self, model_path: Optional[str] = None, tokenizer_path: Optional[str] = None):
        self.model_path = model_path or settings.MODEL_PATH
        self.tokenizer_path = tokenizer_path or settings.TOKENIZER_PATH
        self.model = None
        self.tokenizer = None
        self.load_model_and_tokenizer()

    def load_model_and_tokenizer(self) -> bool:
        """Loads the TensorFlow model and tokenizer from disk. Returns True if successful."""
        try:
            if not os.path.exists(self.model_path) or not os.path.exists(self.tokenizer_path):
                logger.warning(
                    f"Model or tokenizer files not found. "
                    f"Model exists: {os.path.exists(self.model_path)}, "
                    f"Tokenizer exists: {os.path.exists(self.tokenizer_path)}. "
                    f"Predictor will run in fallback keyword mode."
                )
                return False
                
            # Import tensorflow locally inside the function to avoid overhead during app startup if fallback is used
            import tensorflow as tf
            
            logger.info(f"Loading TensorFlow model from: {self.model_path}")
            self.model = tf.keras.models.load_model(self.model_path)
            
            logger.info(f"Loading Tokenizer from: {self.tokenizer_path}")
            with open(self.tokenizer_path, "rb") as f:
                self.tokenizer = pickle.load(f)
                
            logger.info("Successfully loaded deep learning classifier assets.")
            return True
        except Exception as e:
            logger.error(f"Failed to load TensorFlow model/tokenizer: {str(e)}. Predictor will run in fallback keyword mode.")
            self.model = None
            self.tokenizer = None
            return False

    def predict_category(self, text: str) -> str:
        """
        Predicts the technology category for a given text segment.
        Falls back to keyword matching if the model is not loaded.
        """
        if not text or not text.strip():
            return "Uncategorized"
            
        # Try running deep learning prediction if model is successfully loaded
        if self.model is not None and self.tokenizer is not None:
            try:
                # Preprocess text
                sequences = self.tokenizer.texts_to_sequences([text])
                padded = pad_sequences(sequences, maxlen=200, padding="post", truncating="post")
                
                # Run prediction
                predictions = self.model.predict(padded, verbose=0)
                predicted_class_idx = int(np.argmax(predictions[0]))
                
                if 0 <= predicted_class_idx < len(CATEGORIES):
                    predicted_cat = CATEGORIES[predicted_class_idx]
                    logger.info(f"ML Classifier prediction: '{predicted_cat}' (confidence={predictions[0][predicted_class_idx]:.2f})")
                    return predicted_cat
            except Exception as e:
                logger.error(f"Error during ML model inference: {str(e)}. Swapping to keyword fallback.")
                
        # Keyword-based fallback classifier
        text_lower = text.lower()
        
        scores = {
            "Artificial Intelligence": 0,
            "Cyber Security": 0,
            "Cloud Computing": 0,
            "Robotics": 0,
            "Databases & Data Engineering": 0
        }
        
        # Define keyword mappings
        keywords = {
            "Artificial Intelligence": ["ai", "artificial intelligence", "machine learning", "neural network", "deep learning", "transformer", "llm", "natural language", "computer vision", "gpt", "reinforcement learning"],
            "Cyber Security": ["security", "cyber", "malware", "firewall", "hacker", "threat", "vulnerability", "encryption", "auth", "zero trust", "penetration test", "intrusion"],
            "Cloud Computing": ["cloud", "kubernetes", "docker", "aws", "azure", "serverless", "microservices", "container", "virtual machine", "load balancer", "devops"],
            "Robotics": ["robot", "robotics", "navigation", "kinematics", "sensor", "actuator", "control", "drone", "slam", "lidar", "trajectory"],
            "Databases & Data Engineering": ["database", "sql", "nosql", "query", "postgres", "mongodb", "sharding", "data pipeline", "etl", "transaction", "warehouse", "acid"]
        }
        
        for category, kw_list in keywords.items():
            for kw in kw_list:
                if kw in text_lower:
                    scores[category] += text_lower.count(kw)
                    
        # Pick the category with the highest matching keyword count
        best_category = max(scores, key=scores.get)
        if scores[best_category] > 0:
            logger.info(f"Fallback Classifier prediction: '{best_category}' (score={scores[best_category]})")
            return best_category
            
        return "Uncategorized"
