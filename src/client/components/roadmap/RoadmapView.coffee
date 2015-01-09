define [
	'marionette', './themes/themeList/ThemeListView.coffee', './grid/GridView.coffee', './roadmap.hbs', 
	'stickit', "css!./roadmap.sass"
], (
	Marionette, ThemeListView, GridView,  tpl
) ->

	class RoadmapView extends Marionette.LayoutView
		template: tpl
		className: 'roadmap'

		regions:
			grid: '#grid-region'
			themes: '#theme-region'

		bindings:
			'[name=name]': 'name'

		# save every change
		initialize: (options) ->
			@listenTo @model, 'change add:themes remove:themes change:themes"', (e) => 
				@model.save()

		onShow: ->
			@stickit()
			@grid.show new GridView
				roadmap: @model
			@themes.show new ThemeListView
				roadmap: @model
