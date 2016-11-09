from bottle import static_file, get, route, run, template
import os
import json
import re

@route('/static/<filepath:path>')
def static(filepath):
    return static_file(filepath,root='./static')

@route('/')
def index():
    return template('index')

@get('/img')
def getImg():
    directory = os.path.join(os.getcwd() + '/static/picture')
    files = os.listdir(directory)
    result = { 'img': [] }
    matcher = re.compile('.+(\.jpg|\.JPG|\.JPEG|\.jpeg)')
    for f in files:
        if matcher.match(f):
            result['img'].append({ 'fname': f })
    return json.dumps(result)

run(host='localhost', port=8080)
