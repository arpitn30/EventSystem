import hashlib
from codecs import encode
from tempfile import gettempdir

from flask import Flask, request, render_template
from flask_mysqldb import MySQL
from flask_session import Session
from flask_mail import Message

from Incubate.helpers import *
from Incubate import app
from Incubate import mysql
from Incubate import mail

from Incubate.views import login
from Incubate.views import event


@app.route('/', methods=['GET', 'POST'])
@login_required
def index():
    pass