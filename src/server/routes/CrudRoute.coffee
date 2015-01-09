CrudService = require '../services/CrudService.coffee'

class CrudRoute

	constructor: (app, @name) ->
		@service = new CrudService(@name)
		app.get "/resources/#{@name}", @find
		app.get "/resources/#{@name}/:id", @get
		app.post "/resources/#{@name}", @create
		app.put "/resources/#{@name}/:id", @update
		app.delete "/resources/#{@name}/:id", @delete

	find: (req, res) =>
		criteria = req.body || {}
		console.log "search #{@name}", criteria
		@service.find criteria, (results) ->
			res.json results

	get: (req, res) =>
		id = req.params.id
		console.log "get #{@name} #{id}"
		@service.get id, (doc) ->
			res.json doc

	create: (req, res) =>
		doc = req.body
		console.log "create #{@name}", doc
		@service.create doc, (result) ->
			res.json result

	update: (req, res) =>
		doc = req.body
		console.log "update #{@name}", doc
		@service.update doc, (result) ->
			res.json result

	delete: (req, res) =>
		id = req.params.id
		console.log "delete #{@name} #{@id}"
		@service.delete id, (result) ->
			res.end()

module.exports = CrudRoute
