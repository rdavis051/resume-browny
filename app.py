from flask import Flask
from flask import render_template

app = Flask(__name__)

@app.route('/')
def identity():
    return render_template("index.html")

if __name__=="__main__":
    app.run(debug=True, port=5003, host="0.0.0.0")