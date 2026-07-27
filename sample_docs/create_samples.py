import os
from reportlab.lib.pagesizes import letter
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib import colors

def create_pdf(filename: str, title: str, paragraphs: list):
    """Generates a PDF document with ReportLab."""
    os.makedirs(os.path.dirname(filename), exist_ok=True)
    doc = SimpleDocTemplate(filename, pagesize=letter, rightMargin=72, leftMargin=72, topMargin=72, bottomMargin=72)
    story = []
    
    styles = getSampleStyleSheet()
    
    # Custom Styles for Sleek look
    title_style = ParagraphStyle(
        'DocTitle',
        parent=styles['Heading1'],
        fontName='Helvetica-Bold',
        fontSize=20,
        leading=24,
        textColor=colors.HexColor('#1d4ed8'),
        spaceAfter=15
    )
    
    h2_style = ParagraphStyle(
        'DocHeading2',
        parent=styles['Heading2'],
        fontName='Helvetica-Bold',
        fontSize=13,
        leading=16,
        textColor=colors.HexColor('#8b5cf6'),
        spaceBefore=10,
        spaceAfter=8
    )
    
    body_style = ParagraphStyle(
        'DocBody',
        parent=styles['Normal'],
        fontName='Helvetica',
        fontSize=10,
        leading=14,
        textColor=colors.HexColor('#374151'),
        spaceAfter=10
    )
    
    # Add title
    story.append(Paragraph(title, title_style))
    story.append(Spacer(1, 12))
    
    # Add content
    for p in paragraphs:
        if p.startswith("## "):
            story.append(Paragraph(p[3:], h2_style))
        else:
            story.append(Paragraph(p, body_style))
            
    doc.build(story)
    print(f"Generated sample document: {filename}")

def main():
    # 1. Artificial Intelligence Sample
    ai_paras = [
        "## Abstract",
        "This paper introduces the architecture of modern deep neural network models, focusing primarily on transformer-based language representations. We analyze the math underlying multi-head self-attention mechanisms and how they optimize loss functions to capture token dependencies.",
        "## Methodology & Deep Learning Architectures",
        "Our methodology utilizes a decoder-only transformer block configured with 32 attention heads, mapping tokens into a 4096-dimensional latent space. During training, we use an Adam optimizer with a cosine learning rate scheduler to reduce cross-entropy loss over a massive dataset of text abstracts.",
        "## Experimental Results & Accuracy",
        "We evaluate the model on standard language benchmarks. The results demonstrate that increasing parameter capacity yields zero-shot accuracy improvements. Fine-tuning adaptation achieves state-of-the-art accuracy levels on complex question answering benchmarks.",
        "## Conclusion & Future Work",
        "We have shown that large-scale model training enhances generalization. Future work will investigate model pruning and distillation techniques to optimize real-time inference latency."
    ]
    create_pdf("sample_docs/sample_artificial_intelligence.pdf", "Advances in Deep Transformer Architectures for NLP", ai_paras)

    # 2. Cyber Security Sample
    sec_paras = [
        "## Introduction to Enterprise Security Threats",
        "Modern corporate networks face sophisticated cyber security threats. Implementing a zero trust network architecture is essential to mitigate security risk and prevent unauthorized database breaches.",
        "## Penetration Testing and Vulnerability Scanning",
        "Our security framework integrates automated vulnerability scanners and regular penetration testing. We analyze firewall access logs and active directory dumps to identify buffer overflow entry points and outdated authentication protocols.",
        "## Cryptographic Data Protection",
        "To secure sensitive records, we utilize advanced cryptographic algorithms. All database records are encrypted using AES-256 in Galois/Counter Mode (GCM), ensuring confidentiality and integrity against SQL injection payloads.",
        "## Security Conclusion",
        "Securing enterprise endpoints requires a defense-in-depth model. Fusing multi-factor authentication (MFA) and zero-trust policies significantly reduces threat vectors and protects corporate intellectual property."
    ]
    create_pdf("sample_docs/sample_cyber_security.pdf", "Zero Trust Architecture and Threat Mitigation", sec_paras)

    # 3. Cloud Computing Sample
    cloud_paras = [
        "## Overview of Cloud-Native Infrastructure",
        "This whitepaper discusses the migration of monolithic architectures to cloud-native microservices. We explore container orchestration systems and high availability resource scaling.",
        "## Kubernetes Container Orchestration",
        "We use Kubernetes to manage dockerized application nodes. The microservices are packaged in Docker containers and deployed across multi-tenant cluster nodes. Auto-scaling rules scale compute resources dynamically based on CPU throughput.",
        "## Load Balancing and Traffic Gateways",
        "To manage external traffic, we configure distributed load balancers and secure proxy gateways. This ensures low latency routing between serverless lambda functions and containerized web engines.",
        "## Summary of Cloud Benefits",
        "Migrating to cloud environments like AWS and Microsoft Azure reduces infrastructure cost. Integrating DevOps pipelines and Infrastructure as Code (IaC) ensures repeatable deployments and minimal operational overhead."
    ]
    create_pdf("sample_docs/sample_cloud_computing.pdf", "Scaling Microservices with Kubernetes Orchestration", cloud_paras)

    # 4. Databases Sample
    db_paras = [
        "## Relational and NoSQL Databases",
        "Modern data engineering pipelines process high-velocity transactions and analytical queries. We review the characteristics of relational PostgreSQL databases and NoSQL document stores.",
        "## Database Sharding and Partitioning",
        "To scale write throughput, we implement distributed database sharding. Table records are partitioned across active nodes based on shard keys. Relational indexes and execution plan optimizations ensure low query latency.",
        "## ETL Workflows and Stream Processing",
        "We design robust ETL data pipeline workflows using Apache Kafka and Flink. Raw events are streamed in real-time, aggregated, and loaded into a columnar data warehouse for analytics queries.",
        "## Summary of ACID and Consistency",
        "Maintaining database transactional consistency requires strict ACID compliance. Our distributed write-ahead logs (WAL) ensure replica replication is fully fault-tolerant during concurrent updates."
    ]
    create_pdf("sample_docs/sample_databases.pdf", "High-Performance Data Engineering and Distributed Sharding", db_paras)

if __name__ == "__main__":
    main()
