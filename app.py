from flask import Flask, render_template
from flask_socketio import SocketIO
from flask_cors import CORS


app = Flask(__name__)
cors = CORS(app)
socketio = SocketIO(app)


@app.route("/")
def home():
    return render_template("chat.html")


@socketio.on('send_message')
def handle_send_message_event(data):
    print(f"Message from {data}")
    socketio.emit('receive_message', data)


if __name__ == '__main__':
    socketio.run(app, port=8000, host="0.0.0.0", debug=True)
