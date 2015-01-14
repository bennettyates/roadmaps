require.config
	baseUrl: "./"
	deps: ["app/app.coffee"]
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
