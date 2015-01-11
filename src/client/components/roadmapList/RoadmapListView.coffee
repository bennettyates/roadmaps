define [
	'marionette', './RoadmapItemView.coffee', 'models/Roadmap.coffee', './roadmapList.hbs', 'css!./roadmapList.sass'
], (
	Marionette, RoadmapItemView, Roadmap, tpl
) ->

	class RoadmapListView extends Marionette.CompositeView

		template: tpl
		childViewContainer: '.roadmaps'
		childView: RoadmapItemView,
		className: 'roadmap-list'

		events:
			'click [data-action=add]': 'handleAdd'

		initialize: (options) ->
			@collection = new Backbone.Collection()
			@collection.model = Roadmap
			@collection.url = '/resources/roadmap'
			@collection.fetch()

		handleAdd: ->
			@collection.create
				name: "New Roadmap"
