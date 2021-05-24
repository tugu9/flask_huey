from flask import Flask
from huey import RedisHuey

DEBUG = True
SECRET_KEY = 'mySecretKey'

app = Flask(__name__)
app.config.from_object(__name__)

huey = RedisHuey('my-app', host='redis-server')

