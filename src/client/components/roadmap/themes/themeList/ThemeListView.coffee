define [
	'marionette', 
	'../theme/ThemeView.coffee', '../editTheme/EditThemeView.coffee', 'models/Theme.coffee',
	'./themeList.hbs', 'css!./themeList.sass'
], (
	Marionette, ThemeView, EditThemeView, Theme, tpl
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
			theme = new Theme
				name: 'New Theme', 
				size: 0
			@collection.add(theme)
			app.modal.show new EditThemeView
				theme: theme

