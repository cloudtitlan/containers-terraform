import os
from flask import Flask

app = Flask(__name__)

PORT = os.getenv("PORT", 8000)


@app.route("/")
def hello_world():
    return "Hello, World!"


if __name__ == "__main__":
    print(f"Starting server on port {PORT}")
    app.run(debug=True, host="0.0.0.0", port=PORT)
