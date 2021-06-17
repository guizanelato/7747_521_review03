from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')
def get_index():
    return jsonify({
           'mensagem': 'Hello from flask'
        })



if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True)
