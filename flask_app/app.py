from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "¡Me obligaron a hacer esto ;-;!"

@app.route('/pagina')
def pagina():
    return "Esta es la página en el puerto 5000 servida por Flask."

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
