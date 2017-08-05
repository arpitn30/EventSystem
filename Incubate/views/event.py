from Incubate.views.home import *

@app.route('/' + session['event'], methods=['GET', 'POST'])
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

