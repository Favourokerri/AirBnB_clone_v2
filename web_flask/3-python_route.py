#!/usr/bin/python3
"""
    Write a script that starts a Flask
    web application:/: display “Hello HBNB!”
"""
from flask import Flask
from markupsafe import escape

app = Flask(__name__)


@app.route('/', strict_slashes=False)
def Hello_HBNB():
    return ("Hello HBNB!")


@app.route('/hbnb', strict_slashes=False)
def hbnb():
    return "HBNB"


@app.route('/c/<text>', strict_slashes=False)
def display_c(text):
    return f"C {escape(text.replace('_', ' '))}"

@app.route('/python/', defaults={'text': 'is_cool'}, strict_slashes=False)
@app.route('/python/<text>', strict_slashes=False)
def display_python(text):
    text = text.replace("_", " ")
    return f"Python {escape(text)}"


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)
