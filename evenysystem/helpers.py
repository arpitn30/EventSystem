from functools import wraps

from flask import redirect, session, url_for, render_template, request


def apology(msg=""):
    """Renders message as an apology to user."""

    def escape(s):
        """
        Escape special characters.

        https://github.com/jacebrowning/memegen#special-characters
        """
        for old, new in [("-", "--"), (" ", "-"), ("_", "__"), ("?", "~q"),
                         ("%", "~p"), ("#", "~h"), ("/", "~s"), ("\"", "''")]:
            s = s.replace(old, new)
        return s

    return render_template("failure.html", msg=escape(msg))


def login_required(f):
    """
    Decorate routes to require login.

    http://flask.pocoo.org/docs/0.11/patterns/viewdecorators/
    """

    @wraps(f)
    def decorated_function(*args, **kwargs):
        if request.method == 'POST':
            event = request.form.get('event')
        else:
            event = None
        if session.get("user_id") is None:
            return redirect(url_for("login", event = event))
        return f(*args, **kwargs)

    return decorated_function
