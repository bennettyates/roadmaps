define ['marionette', './roadmapItem.hbs'], (Marionette, tpl) ->

	class RoadmapItemView extends Marionette.ItemView
		template: tpl
		tagName: 'li'
		events:
			"click .edit": 'handleOpenRoadmap'

		handleOpenRoadmap: (e) ->
			e.stopPropagation()
			$target = $(e.target)
			app.vent.trigger "show-roadmap", $target.attr('data-id')
