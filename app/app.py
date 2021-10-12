import socket
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!<br>I am using docker ' + socket.gethostname()