#!/bin/bash
sudo dnf -y install epel-release
sudo dnf install nginx -y

sudo pip3 install virtualenv

sudo su -
mkdir /myproject && cd /myproject

virtualenv projectenv

source projectenv/bin/activate

pip3 install flask gunicorn

vim /myproject/hello.py
"""
from flask import Flask
application = Flask(__name__)

@application.route("/")
def hello():
    return "<h1 style='color:green'>Hello World, Flask is amazing!</h1>"

if __name__ == "__main__":
    application.run(host='0.0.0.0')
"""	

sudo firewall-cmd --add-port=5000/tcp --permanent
sudo firewall-cmd --reload

python hello.py

#http://34.41.148.216:5000/




#  Part 2
vim /myproject/wsgi.py
"""
from hello import application

if __name__ == "__main__":
    application.run()
"""

sudo firewall-cmd --add-port=8080/tcp --permanent
sudo firewall-cmd --reload

cd /myproject

gunicorn --bind 0.0.0.0:8080 wsgi

#http://34.41.148.216:8080/