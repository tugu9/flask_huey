from flask import render_template
from flask import request

from app import app
from tasks import example_task


@app.route('/', methods=['GET', 'POST'])
def home():
    if request.method == 'POST' and request.form.get('n'):
        n = request.form['n']

        # Enqueue our task, the consumer will pick it up and run it.
        output = example_task(n)
        output = output(blocking=True)
        # message = 'Enqueued example_task(%s) - see consumer output' % n
        message = 'The task output: (%d)' % output
    else:
        message = None

    return render_template('home.html', message=message)