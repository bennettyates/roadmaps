Client = require('mongodb').MongoClient
ObjectID = require('mongodb').ObjectID

class DB

	init: (callback) ->
		Client.connect "mongodb://localhost:27017/roadmap", (err, db) =>
			if err
				console.dir err
			@db = db
			callback()

	collection: (name) ->
		@db.collection(name)

	makeId: (id) ->
		ObjectID(id)

module.exports = new DB()
