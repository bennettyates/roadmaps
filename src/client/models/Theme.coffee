define ['backbone', 'backbone.relational'], (Backbone) ->

	class Theme extends Backbone.RelationalModel
		initialize: (options) ->
			# change to a theme is a change to the roadmap
			@on 'change', (context) ->
				roadmap = @get 'roadmap'
				if roadmap?
					roadmap.trigger 'change', @

	# not sure if this is needed backbone-relational has some coffeescript weirdness
	Theme.setup()
