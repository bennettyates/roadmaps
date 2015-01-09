define [
	'marionette', 'components/roadmap/themes/theme/ThemeView.coffee', './themeList.hbs', 'css!./themeList.sass'
], (
	Marionette, ThemeView, tpl
) ->

	class ThemeListView extends Marionette.CompositeView
		template: tpl
		id: 'theme-list'
		childViewContainer: '.themes'
		childView: ThemeView,

		events:
			'click [data-action=add]': 'handleAdd'

		initialize: (options) ->
			@roadmap = options.roadmap
			@collection = @roadmap.get('themes')

		handleAdd: () ->
			console.log 'add handler'
			@collection.add({ name: 'New Theme' })

