from flask import Flask
import os

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello, this is a simple Flask app running in a Docker container on Kubernetes!"

if __name__ == "__main__":
    app.run(debug=True)
