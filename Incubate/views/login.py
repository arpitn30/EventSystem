from Incubate.views.home import *

@app.route('/login', methods=['GET', 'POST'])
def login():
    """Log User In"""

    # forget any user_id
    session.clear()

    # If the user has been redirected through an event url
    event = request.args['event']

    # if user reached route via POST (as by submitting a form via POST)
    if request.method == 'POST':
        if not request.form.get("username") or not request.form.get("password"):
            return render_template('failure.html', msg='Username/Password fields cannot be empty')

        # query database for username
        db = mysql.connection.cursor()

        rows = db.execute("SELECT * FROM users WHERE email = '{}'".format(request.form.get("email")))
        rv = db.fetchone()

        # verify password
        if rows and rv['password'] == encode(hashlib.sha1(encode(request.form.get("password", 'utf-8'))).digest(),
                                        'hex_codec').decode('utf-8'):
            # create session
            session['user_id']  = rv['id']

            if event == None:
                return redirect(url_for('index', verified = rv['email_verified']))
            else:
                return redirect(url_for(event))

        else:
            return render_template('failure.html', msg="Invalid Username And/Or Password")

    # else if user reached route via GET (as by clicking a link or via redirect)
    else:
        return render_template('login.html', event = event)




@app.route('/register', methods=['GET', 'POST'])
def register():
    """Register User"""

    # forget any user_id
    session.clear()

    # If the user has been redirected through an event url
    event = request.args['event']

    # if user reached route via POST (as by submitting a form via POST)
    if request.method == 'POST':

        # check if form fields are empty and if entered passwords match
        if not request.form.get("username") or not request.form.get("password") or not request.form.get("email"):
            return render_template('failure.html', msg='Username/ Password/ Email fields cannot be empty')
        if request.form.get("password") != request.form.get("confirmation"):
            return render_template('failure.html', msg='Password fields do not match')

        # create connection
        db = mysql.connection.cursor()

        # query database to see if username already exists
        rows = db.execute(
            "SELECT * FROM users WHERE email = '{}' ".format(request.form.get("username")))
        if rows:
            return render_template('failure.html', msg='Username Already Exists')

        # hash password with SHA-1 algorithm and store it as string
        password = encode(hashlib.sha1(encode(request.form.get("password", 'utf-8'))).digest(),
                          'hex_codec').decode('utf-8')


        db.execute(
            "INSERT IGNORE INTO users (first_name, last_name, email, password) VALUES ('{0}', '{1}', '{2}', '{3}')".format(
                request.form.get("first_name"), request.form.get("last_name"), request.form.get("email"), password))
        mysql.connection.commit()

        # get id and auth level
        db.execute("SELECT * FROM users WHERE email = '{}'".format(request.form.get("email")))
        rv = db.fetchone()

        # create session
        session['user_id']  = rv['id']

        if event == None:
            return redirect(url_for('index', verified = False))
        else:
            return redirect(url_for(event))

    # else if user reached route via GET (as by clicking a link or via redirect)
    else:
        return render_template('register.html', event = event)
