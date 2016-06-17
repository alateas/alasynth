from flask import Flask, render_template
app = Flask(__name__)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/synth')
def synth():
    return render_template('synth.html')

@app.route('/updown')
def updown():
    return render_template('updown.html')

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)