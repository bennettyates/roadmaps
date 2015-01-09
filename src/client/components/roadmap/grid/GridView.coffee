define ['marionette', './grid.hbs'], (Marionette, tpl) ->

	class GridView extends Marionette.ItemView
		template: tpl
		className: 'grid-view'
