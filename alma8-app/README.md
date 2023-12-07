###### Reference
###### https://www.geeksforgeeks.org/python-introduction-to-web-development-using-flask/?ref=lbp
```
sudo pip3 install flask_sslify

vi app.py
# Import libraries.
from flask import Flask, escape, request
from markupsafe import escape
 
# Define the application.
app = Flask(__name__)
 
# Define a base URI route and function.
@app.route('/')
def index():
  return "Hello World!"
 
# Define an application URI route and function.
@app.route("/hello")
def hello():
  name = request.args.get("name","Simon")
  return f'Hello {escape(name)}!'
 
# Define an about URI route and function.
@app.route("/about")
def about():
  return "About Page."
 
# Define an <username> variable rule for a route.
@app.route("/user/<string:username>")
def show_user_profile(username):
  return 'User [%s].' % escape(username)
 
# Define an <username> variable rule for a route.
@app.route("/year/<int:year>")
def show_post(year):
  return 'Year [%d].' % year
 
# Run the file.
if __name__ == "__main__":
  app.run()

export FLASK_APP=hello.py
flask run


```