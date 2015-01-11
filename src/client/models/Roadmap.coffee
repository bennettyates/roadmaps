define ['backbone', './Theme.coffee', 'backbone.relational'], (Backbone, Theme) ->

	class Roadmap extends Backbone.RelationalModel
		idAttribute: "_id"
		urlRoot: '/resources/roadmap'
		relations: [
			type: Backbone.HasMany
			key: 'themes'
			relatedModel: Theme
			reverseRelation:
				key: 'roadmap'
		]

	# not sure if this is needed backbone-relational has some coffeescript weirdness
	Roadmap.setup()
