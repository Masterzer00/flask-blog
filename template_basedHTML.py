from flask import Flask,render_template,request,session,redirect,flash
from datetime import datetime
import os
from werkzeug.utils import secure_filename
from flask_sqlalchemy import SQLAlchemy
from flask_mail import Mail

import json
import math
with open('config.json', 'r') as c:
    params=json.load(c)["params"]

local_server=True

app=Flask(__name__)
app.secret_key = 'super secret key'
app.config['uploader_location']=params['upload_location']
app.config.update(
    MAIL_SERVER='smtp.gmail.com',
    MAIL_PORT='465',
    MAIL_USE_SSL=True,
    MAIL_USERNAME=params['USER'],
    MAIL_PASSWORD=params['password']

)
mail = Mail(app)
if(local_server):
    app.config['SQLALCHEMY_DATABASE_URI']=params['local_uri']
else:
    app.config['SQLALCHEMY_DATABASE_URI'] = params['prod_uri']

db = SQLAlchemy(app)


class Contactm(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    phone_no = db.Column(db.String(12), nullable=False)
    email = db.Column(db.String(40), nullable=False)
    mes = db.Column(db.String(400), nullable=False)
    name = db.Column(db.String(40), nullable=False)

class Post(db.Model):
    no = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(50), nullable=False)
    slug = db.Column(db.String(30), nullable=False)
    content = db.Column(db.String(400), nullable=False)
    img_file=db.Column(db.String(20), nullable=True)
    date_time=db.Column(db.String(30), nullable=False)
class what():
    log='N'
    out='logout'
@app.route('/')
def home():
    if 'user' in session and session['user'] == params['admin_user']:
        l=what.out
    else:
        l = what.log
    post = Post.query.filter_by().all()
    last=math.ceil(len(post)/int(params['no_of_posts']))
    page=request.args.get('page')
    if(not str(page).isnumeric()):
        page=1
    page=int(page)

    post=post[(page-1)*int(params['no_of_posts']):(page-1)*int(params['no_of_posts'])+int(params['no_of_posts'])]
    if page==1:
        prev="#"
        next="/?page="+str(page+1)
    elif page==last:
        prev="/?page="+str(page-1)
        next="#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html',params=params,post=post,prev=prev,next=next,l=l)
@app.route('/index.html')
def index():
    if 'user' in session and session['user'] == params['admin_user']:
        l=what.out
    else:
        l = what.log


    post = Post.query.filter_by().all()
    last = math.ceil(len(post) / int(params['no_of_posts']))
    page = request.args.get('page')
    if (not str(page).isnumeric()):
        page = 1
    page = int(page)

    post = post[
           (page - 1) * int(params['no_of_posts']):(page - 1) * int(params['no_of_posts']) + int(params['no_of_posts'])]
    if page == 1:
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif page == last:
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)
    return render_template('index.html',params=params,post=post,l=l,next=next,prev=prev)
@app.route('/logout.html')
def logout():
    if 'user' in session and session['user'] == params['admin_user']:

        session.pop('user')
        return redirect('/login.html')

@app.route('/uploader',methods=['GET','POST'])

def upload():
    if 'user' in session and session['user'] == params['admin_user']:
        l=what.out
    else:
        l = what.log
    if 'user' in session and session['user'] == params['admin_user']:
        if (request.method =='POST'):
            f=request.files['file1']
            f.save(os.path.join(app.config['uploader_location'],secure_filename(f.filename)))
            return "uploaded successfully"

    post = Post.query.filter_by().all()
    return render_template('index.html',params=params,post=post,l=l)

@app.route('/about.html')
def about():
    if 'user' in session and session['user'] == params['admin_user']:
        l=what.out
    else:
        l = what.log
    return render_template('about.html',params=params,l=l)

@app.route('/login.html',methods=('GET','POST'))
def login():

    if 'user' in session and session['user']==params['admin_user']:
        if 'user' in session and session['user'] == params['admin_user']:
            l = what.out
        else:
            l = what.log
        post = Post.query.filter_by().all()
        return render_template('dashboard.html',params=params,post=post,l=l)

    if request.method=="POST":
        username=request.form.get('uname')
        userpass = request.form.get('pass')
        if(username==params['admin_user']and userpass==params['admin_pass']):
           l = what.out
           session['user']=username
           post = Post.query.filter_by().all()

            #for making a user logged in to the website -a session
           return render_template('dashboard.html',params=params,post=post,l=l)

        else:
            error="Invalid ID or Password"
            return render_template("login.html", params=params,error=error)


    return render_template("login.html", params=params)


@app.route('/post.html/<string:post_slug>',methods=['GET'])
def post_route(post_slug):
    if 'user' in session and session['user'] == params['admin_user']:
        l = what.out
    else:
        l = what.log

    post=Post.query.filter_by(slug=post_slug).first()

    return render_template('post.html',params=params,post=post,l=l)
@app.route('/delete/<string:no>',methods=('GET','POST'))
def delete(no):
    if 'user' in session and session['user'] == params['admin_user']:
        post=Post.query.filter_by(no=no).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/login.html')


@app.route('/edit/<string:no>',methods=('GET','POST'))
def edit(no):
    if 'user' in session and session['user'] == params['admin_user']:
        l = what.out
    else:
        l = what.log
        if(type(no)==int):
            no=str(no)
        else:
            no = str(no)
        if request.method =='POST':
            title=request.form.get('title')
            slug=request.form.get('slug')
            content=request.form.get('content')
            img_file=request.form.get('img_file')
            if no == '0':

                now = datetime.now()
                post = Post(no=no,title=title, slug=slug, content=content, img_file=img_file,date_time=now)
                db.session.add(post)
                db.session.commit()
                flash("Post successfully added")
                return redirect('/edit/0')

            else:

                now = datetime.now()

                post = Post.query.filter_by(no=no).first()
                post.date_time = now
                post.title = title
                post.slug = slug
                post.content = content
                post.img_file = img_file
                db.session.commit()
                flash("Post successfully edited")
                return redirect('/edit/' + no)

    post = Post.query.filter_by(no=no).first()
    return render_template('edit.html',params=params,post=post,l=l,no=no)


@app.route('/contact.html',methods=('GET','POST'))
def contact():
    if 'user' in session and session['user'] == params['admin_user']:
        l = what.out
    else:
        l = what.log

    if(request.method=='POST'):

        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')
        entry = Contactm(name=name, phone_no = phone, mes = message,email = email )
        db.session.add(entry)
        db.session.commit()
        mail.send_message('New message from ' + name,
                          sender=email,
                          recipients = [params['USER']],
                          body = message + "\n" + phone
                          )

    return render_template('contact.html',params=params,l=l)
# @app.route('/post')
# def post():
#
#     return render_template('post.html')
app.run(debug=True)