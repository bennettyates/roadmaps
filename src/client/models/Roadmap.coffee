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
