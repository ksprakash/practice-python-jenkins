import flask
import socket

app = flask.Flask(__name__)

@app.route("/")
def main():
    return f"Container Name is: {socket.gethostname()}"

if __name__ == "__main__":
   app.run(host="0.0.0.0",port=3000,debug=True)
