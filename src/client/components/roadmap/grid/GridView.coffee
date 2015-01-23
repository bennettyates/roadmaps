define ['marionette', './grid.hbs'], (Marionette, tpl) ->

	class GridView extends Marionette.ItemView
		template: tpl
		className: 'grid-view'
		templateHelpers:
			resources: 4
			weeks: 3
			assignments: [
				[1, 1, 1]
				[1, 1, 1]
				[1, 1, 1]
			]
