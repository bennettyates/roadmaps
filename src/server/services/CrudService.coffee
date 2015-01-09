db = require '../db.coffee'

class CrudService

	constructor: (@name) ->

	getCollection: ->
		collection = db.collection(@name)
		collection

	find: (criteria, callback) ->
		@getCollection().find criteria, (err, cursor) ->
			if err then console.dir err
			cursor.toArray (err, results) ->
				if err then console.dir err
				callback(results || [])

	get: (id, callback) ->
		@getCollection().findOne db.makeId(id), (err, doc) ->
			console.log "findOne", id, err, doc
			if err then console.dir err
			callback doc

	create: (doc, callback) ->
		console.log "creating", doc
		@getCollection().insert doc, {w:1}, (err, results) ->
			console.log "got ", results
			if err then console.dir err
			callback results[0]

	update: (doc, callback) ->
		id = doc._id
		delete doc._id
		console.log "updating", id, doc
		@getCollection().update { _id: db.makeId(id) }, doc, {w:1}, (err, result) ->
			if err then console.dir err
			callback result

	delete: (id, callback) ->
		console.log "removing", id
		@getCollection().remove { _id: db.makeId(id) }, {w:1}, (err, result) ->
			if err then console.dir err
			callback result

module.exports = CrudService
