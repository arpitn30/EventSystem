from Incubate.views.home import *

@app.route('/event', methods=['GET', 'POST'])
@login_required
def event():
    event = session['event']
    del session['event']

    if request.method == 'POST':
        pass
    else:
        db = mysql.connection.cursor()
        rows = db.execute("SELECT * FROM users WHERE id = '{}'".format(session['user_id']))
        rv = db.fetchone()

        render_template('event.html', event = event)


@app.route('/createteam', methods=['GET', 'POST'])
def createteam():
    if request.method == 'POST':
        event = request.args.get('event')

        table = event + 'team'

        db = mysql.connection.cursor()
        db.execute("SELECT email FROM users WHERE id = '{}'".format(session['user_id']))
        email = db.fetchone()

        db.execute(
            "INSERT IGNORE INTO " + table +" (team_name, user1, user2, user3, user4, user5) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')".format(
            request.form.get("team_name"), email, request.form.get("user2"), request.form.get("user3"), request.form.get("user4"), request.form.get("user5")))
        mysql.connection.commit()

        return redirect(url_for('questions', event = event))

    else:
        event = request.args.get('event')
        return render_template('createteam.html', event = event)


@app.route('/questions', methods=['GET', 'POST'])
def questions():
    return render_template('failure.html')