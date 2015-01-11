define [
	'marionette', './themes/themeList/ThemeListView.coffee', './grid/GridView.coffee', './roadmap.hbs', 
	"css!./roadmap.sass"
], (
	Marionette, ThemeListView, GridView,  tpl
) ->

	class RoadmapView extends Marionette.LayoutView
		template: tpl
		className: 'roadmap'

		regions:
			grid: '#grid-region'
			themes: '#theme-region'

		initialize: (options) ->
			# after first sync save every change
			@listenToOnce @model, 'sync', ->
				@listenTo @model, 'change add:themes remove:themes change:themes"', (context) => 
					@model.save()

		onShow: ->
			@grid.show new GridView
				roadmap: @model
			@themes.show new ThemeListView
				roadmap: @model
