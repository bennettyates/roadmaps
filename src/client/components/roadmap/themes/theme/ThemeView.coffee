define [
	'marionette', 'components/modal/ModalView.coffee', '../editTheme/EditThemeView.coffee', './theme.hbs', 'css!./theme.sass'
], (
	Marionette, ModalView, EditThemeView, tpl
) ->

	class ThemeView extends Marionette.ItemView
		template: tpl
		className: 'theme'

		initialize: (options) ->
			@themesCollection = options.themesCollection
			app.vent.on 'theme:selected', @handleThemeSelection

		events:
			'click': 'handleClick'
			'click [data-action=edit]': 'handleEdit'
			'click [data-action=delete]': 'handleDelete'

		handleDelete: (e) ->
			e.stopPropagation()
			@model.destroy()

		handleClick: (e) ->
			e.stopPropagation()
			$target = $(e.target).closest('.theme')
			app.vent.trigger 'theme:selected', $target.index()

		handleEdit: (e) ->
			e.stopPropagation()
			modal = new ModalView
				title: "Edit \"" + (@model.get 'name') + '\"...'
			app.modal.show modal
			modal.body.show new EditThemeView()

		handleThemeSelection: (index) =>
			myIndex = @$el.index()
			if myIndex is index
				@$el.addClass 'selected'
			else
				@$el.removeClass 'selected'
