from flask import Flask, jsonify
import os, redis

REDIS_HOST = os.getenv("REDIS_HOST", "redis")
r = redis.Redis(host=REDIS_HOST, port=6379, decode_responses=True)

app = Flask(__name__)

@app.get("/health")
def health():
    return "OK", 200

@app.get("/")
def root():
    return jsonify(status="ok")

@app.get("/hits")
def hits():
    n = r.incr("hits")
    return jsonify(hits=n)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8080)
