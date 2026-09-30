from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.get("/")
def home():
    return jsonify({
        "project": "End-to-End DevOps CI/CD Pipeline",
        "author": "Niranjan J U",
        "environment": os.getenv("ENVIRONMENT", "dev"),
        "message": "Deployed with GitHub Actions + Docker Hub + Amazon EKS",
    })

@app.get("/health")
def health():
    return jsonify({"status": "healthy"})


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
