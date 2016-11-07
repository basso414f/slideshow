from bottle import static_file, get, route, run, template
import os
import json

@route('/static/<filepath:path>')
def static(filepath):
    return static_file(filepath,root='./static')

@route('/')
def index():
    return template('index')

@get('/img')
def getImg():
    directory = '/Users/bear/work/slideshow/slick/static/picture'
    files = os.listdir(directory)
    result = { 'img': [] }
    for f in files:
        result['img'].append({ 'fname': f })
    return json.dumps(result)

run(host='localhost', port=8080)
