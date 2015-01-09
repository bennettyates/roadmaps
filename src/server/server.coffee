express = require 'express'
bodyParser = require 'body-parser'
CrudRoute = require './routes/CrudRoute.coffee'

db = require './db.coffee'

PORT = 8003
DOCROOT = __dirname + '/../client/'

db.init () ->

	app = express()

	app.use bodyParser.json()
	app.use bodyParser.urlencoded({extended: true})

	new CrudRoute(app, 'roadmap')
	new CrudRoute(app, 'theme')

	app.use(express.static(DOCROOT));

	app.listen PORT
	console.log "Listening on port", PORT
	console.log "Document root", DOCROOT
