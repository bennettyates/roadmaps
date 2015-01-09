require.config
	baseUrl: "./"
	paths:
		"underscore": "lib/lodash/dist/lodash.min"
		"jquery": "lib/jquery/dist/jquery.min"
		"handlebars": "lib/handlebars/handlebars"
		"backbone": "lib/backbone/backbone"
		'stickit': 'lib/backbone.stickit/backbone.stickit'
		'backbone.relational': 'lib/backbone.relational/backbone-relational'
		"marionette": "lib/backbone.marionette/lib/backbone.marionette"
		"moment": "lib/momentjs/moment"
		"bootstrap": "lib/bootstrap/dist/js/bootstrap"

	shim:
		"underscore":
			exports: "_" 
		'handlebars':
			exports: 'Handlebars'
		"backbone":
			deps: ["underscore", "jquery"]
			exports: "Backbone"
		'stickit': ['backbone']
		'backbone.relational': ['backbone']
		"marionette":
			deps: ["backbone"]
			exports: "Marionette"
		"moment":
			exports: "moment"
		"bootstrap": ['jquery']

	map:
		"*":
			"css": "lib/require-css/css",
			"text": "lib/requirejs-text/text"

require [
	"backbone", "marionette", "app/AppRouter.coffee", "components/modal/ModalRegion.coffee",
	"bootstrap",
	"css!lib/bootstrap/dist/css/bootstrap",
	"css!lib/fontawesome/css/font-awesome",
	"css!/app/app.sass"
], (
	Backbone, Marionette, AppRouter, ModalRegion
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

	app.start();
	Backbone.history.start();
