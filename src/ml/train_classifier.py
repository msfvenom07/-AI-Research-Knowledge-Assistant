import os
import pickle
import numpy as np
import tensorflow as tf
from tensorflow.keras import layers, models
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from src.ml.dataset_prep import generate_dataset, CATEGORIES

def build_and_train_classifier(
    vocab_size: int = 5000,
    max_len: int = 200,
    embedding_dim: int = 64,
    epochs: int = 15,
    batch_size: int = 32
):
    print("Generating synthetic dataset...")
    # Generate 150 samples per category for a robust training dataset
    texts, labels = generate_dataset(samples_per_category=150)
    num_classes = len(CATEGORIES)
    
    print(f"Total dataset size: {len(texts)} samples across {num_classes} categories.")
    
    # 1. Feature Engineering (Tokenizer)
    print("Fitting tokenizer...")
    tokenizer = Tokenizer(num_words=vocab_size, oov_token="<OOV>")
    tokenizer.fit_on_texts(texts)
    
    # Convert texts to sequences
    sequences = tokenizer.texts_to_sequences(texts)
    padded_sequences = pad_sequences(sequences, maxlen=max_len, padding="post", truncating="post")
    
    # Convert labels to numpy array
    labels = np.array(labels)
    
    # 2. Define Model Architecture
    print("Compiling model...")
    model = models.Sequential([
        # Embedding layer to convert integer token sequences to dense vectors
        layers.Embedding(input_dim=vocab_size, output_dim=embedding_dim, input_length=max_len),
        layers.GlobalAveragePooling1D(),
        layers.Dense(64, activation='relu'),
        layers.Dropout(0.3),
        layers.Dense(num_classes, activation='softmax')
    ])
    
    model.compile(
        optimizer='adam',
        loss='sparse_categorical_crossentropy',
        metrics=['accuracy']
    )
    
    # 3. Model Training
    print("Starting training...")
    # Train-val split (80-20)
    split_idx = int(len(texts) * 0.8)
    
    train_x, val_x = padded_sequences[:split_idx], padded_sequences[split_idx:]
    train_y, val_y = labels[:split_idx], labels[split_idx:]
    
    history = model.fit(
        train_x, 
        train_y, 
        epochs=epochs, 
        batch_size=batch_size, 
        validation_data=(val_x, val_y),
        verbose=1
    )
    
    # Evaluate model
    loss, val_acc = model.evaluate(val_x, val_y, verbose=0)
    print(f"Training complete. Validation Accuracy: {val_acc:.4f}")
    
    # Ensure directories exist
    os.makedirs("models", exist_ok=True)
    
    # 4. Model & Tokenizer Persistence
    model_path = "models/tf_classifier.h5"
    tokenizer_path = "models/tokenizer.pickle"
    
    print(f"Saving model to {model_path}...")
    model.save(model_path)
    
    print(f"Saving tokenizer to {tokenizer_path}...")
    with open(tokenizer_path, "wb") as f:
        pickle.dump(tokenizer, f, protocol=pickle.HIGHEST_PROTOCOL)
        
    print("Classification training pipeline successfully completed.")
    return model, tokenizer

if __name__ == "__main__":
    build_and_train_classifier()
