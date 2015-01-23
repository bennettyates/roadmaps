define [
	"backbone", "marionette", "handlebars", 
	"app/AppRouter.coffee", "components/modal/ModalRegion.coffee",
	"bootstrap",
	"css!lib/bootstrap/dist/css/bootstrap",
	"css!lib/fontawesome/css/font-awesome",
	"css!/app/app.sass"
], (
	Backbone, Marionette, Handlebars, AppRouter, ModalRegion
) ->

	window.app = new Marionette.Application()
	app.router = new AppRouter()

	app.addRegions
		'main': '#main'
		'modal': new ModalRegion()

	app.vent.on "show-roadmap", (id) ->
		app.router.navigate "#roadmap/#{id}", { trigger: true, replace: false }
	app.vent.on "list-roadmaps", () ->
		app.router.navigate "#", { trigger: true, replace: false }

	Handlebars.registerHelper "repeat", (n, options) ->
		console.log "repeat", n
		buffer = ""
		for i in [0...n]
			buffer = buffer + options.fn(this)
		buffer

	app.start();
	Backbone.history.start();
