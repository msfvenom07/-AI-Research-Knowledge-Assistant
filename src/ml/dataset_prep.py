import random
from typing import Tuple, List

# Define the target classification categories
CATEGORIES = [
    "Artificial Intelligence",
    "Cyber Security",
    "Cloud Computing",
    "Robotics",
    "Databases & Data Engineering"
]

# Vocabulary lists to construct realistic-looking technical sentences
vocab = {
    "Artificial Intelligence": {
        "subjects": ["Deep neural networks", "Transformer architectures", "Large language models", "Reinforcement learning agents", "Convolutional networks", "Supervised learning algorithms", "Generative adversarial networks", "Self-supervised representations"],
        "verbs": ["optimize parameters for", "achieve state-of-the-art results on", "enhance generalization capabilities in", "process sequential token lists for", "learn dense embeddings representing", "converge towards global minima during", "generate natural responses during"],
        "objects": ["complex computer vision benchmarks", "natural language processing tasks", "multi-agent reinforcement games", "speech recognition accuracy metrics", "latent space dimensional reductions", "zero-shot generalization tests", "fine-tuning downstream adaptations"]
    },
    "Cyber Security": {
        "subjects": ["Intrusion detection systems", "Zero trust network architectures", "Malware detection scanners", "Penetration testing frameworks", "Advanced persistent threats (APTs)", "Cryptographic encryption protocols", "Endpoint security agents", "Multi-factor authentication (MFA) mechanisms"],
        "verbs": ["mitigate risks associated with", "prevent unauthorized remote access from", "detect malicious payload injections within", "exploit buffer overflow vulnerabilities in", "encrypt confidential database records using", "analyze suspicious network traffic patterns for", "quarantine infected binary executables in"],
        "objects": ["distributed denial-of-service (DDoS) attempts", "cross-site scripting (XSS) attack vectors", "ransomware decryption key requests", "sql injection backdoors", "corporate firewall access logs", "active directory credential dumps", "phishing email header variations"]
    },
    "Cloud Computing": {
        "subjects": ["Kubernetes container orchestration", "Serverless lambda functions", "Multi-tenant cloud infrastructures", "Auto-scaling virtual machines", "Microservice gateway architectures", "Distributed load balancers", "Hybrid cloud deployment pipelines", "Containerized runtime engines"],
        "verbs": ["optimize resource allocation across", "scale computing resources dynamically in", "deploy infrastructure as code using", "monitor cluster nodes throughput for", "ensure high availability configurations on", "migrate monolithic on-premise components to", "reduce operational latency overhead between"],
        "objects": ["elastic compute cloud instances", "object storage bucket replication zones", "dockerized application nodes", "serverless compute runtimes", "cloud-native kubernetes pods", "secure shell (SSH) proxy gateways", "devops pipeline deployments"]
    },
    "Robotics": {
        "subjects": ["Robotic manipulator manipulators", "Autonomous path planning algorithms", "Inverse kinematics calculation engines", "LIDAR and sensor fusion systems", "PID actuator feedback controllers", "Mobile robot navigation platforms", "Aerial drone micro-controllers", "Humanoid robot posture balances"],
        "verbs": ["compute collision-free paths for", "stabilize dynamic locomotion structures of", "fuse spatial sensor inputs in", "control torque levels across joint", "execute precision pick-and-place routines on", "map unstructured 3D environments for", "calculate trajectory velocities matching"],
        "objects": ["robotic arm six-axis joints", "quadcopter flight dynamics control", "lidar-based simultaneous localization (SLAM)", "industrial welding automated paths", "brushless DC motor drive feedback", "collision avoidance safety envelopes", "autonomous vehicle steering outputs"]
    },
    "Databases & Data Engineering": {
        "subjects": ["Distributed database sharding", "Relational indexing systems", "NoSQL document stores", "ETL data pipeline workflows", "Transactional ACID compliance engines", "Data warehouse column stores", "Distributed ledger records", "Stream processing engines (Kafka/Flink)"],
        "verbs": ["optimize query execution plans for", "ensure concurrent write throughput in", "replicate table records across", "aggregate big data partitions for", "maintain transactional consistency during", "index raw unstructured events inside", "stream high-velocity event topics to"],
        "objects": ["complex relational SQL queries", "high-availability replica databases", "nosql key-value data storage", "analytical dashboard query engines", "partitioned write-ahead logs (WAL)", "columnar storage query indexes", "real-time clickstream data warehouses"]
    }
}

def generate_synthetic_sentence(category: str) -> str:
    """Generates a random technical sentence for a specific category."""
    cat_vocab = vocab[category]
    sub = random.choice(cat_vocab["subjects"])
    verb = random.choice(cat_vocab["verbs"])
    obj = random.choice(cat_vocab["objects"])
    
    # Add some transition phrases or adjectives
    transitions = [
        "In this work,", "Specifically,", "We show that", "Consequently,", "Our results indicate that", 
        "To solve this problem,", "In modern environments,"
    ]
    prefix = random.choice(transitions) if random.random() > 0.4 else ""
    
    sentence = f"{prefix} {sub} is designed to {verb} {obj}."
    return sentence.strip().capitalize()

def generate_synthetic_document(category: str, num_sentences: int = 5) -> str:
    """Generates a paragraph block representing a technical paper abstract or introduction."""
    sentences = [generate_synthetic_sentence(category) for _ in range(num_sentences)]
    
    # Make sure we inject specific topic-defining words to help training
    topic_keywords = {
        "Artificial Intelligence": ["machine learning", "neural network", "deep learning", "model training", "accuracy", "dataset", "transformer", "classification", "loss function"],
        "Cyber Security": ["security", "firewall", "encryption", "malware", "vulnerability", "attack", "hacker", "auth", "threat", "cybersecurity"],
        "Cloud Computing": ["cloud", "kubernetes", "docker", "aws", "azure", "serverless", "microservices", "deployment", "scaling", "vm"],
        "Robotics": ["robot", "robotics", "navigation", "kinematics", "sensor", "actuator", "control", "drone", "slam", "trajectory"],
        "Databases & Data Engineering": ["database", "sql", "nosql", "query", "postgres", "data pipeline", "sharding", "analytics", "etl", "transaction"]
    }
    
    # Randomly inject 2-3 topic keywords into the text
    text = " ".join(sentences)
    words = text.split()
    for _ in range(3):
        insert_idx = random.randint(0, len(words) - 1)
        keyword = random.choice(topic_keywords[category])
        words.insert(insert_idx, keyword)
        
    return " ".join(words)

def generate_dataset(samples_per_category: int = 100) -> Tuple[List[str], List[int]]:
    """Generates a balanced dataset of technical texts and integer labels."""
    texts = []
    labels = []
    
    # Set seed for reproducibility
    random.seed(42)
    
    for label_idx, category in enumerate(CATEGORIES):
        for _ in range(samples_per_category):
            texts.append(generate_synthetic_document(category, num_sentences=random.randint(4, 7)))
            labels.append(label_idx)
            
    # Shuffle the dataset
    combined = list(zip(texts, labels))
    random.shuffle(combined)
    texts, labels = zip(*combined)
    
    return list(texts), list(labels)
