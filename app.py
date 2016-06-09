from flask import Flask, render_template
app = Flask(__name__, static_folder='static')

@app.route('/')
def hello_world():
    return 'Hello, World 2!'

@app.route('/home')
def home():
    """Render website's home page."""
    return render_template('home.html')