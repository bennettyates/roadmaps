define [
	'marionette', '../editTheme/EditThemeView.coffee', './theme.hbs', 'css!./theme.sass'
], (
	Marionette, EditThemeView, tpl
) ->

	class ThemeView extends Marionette.ItemView
		template: tpl
		className: -> "theme"

		initialize: (options) ->
			app.vent.on 'theme:selected', @handleThemeSelection
			@listenTo @model, 'change', => @render()

		events:
			'click [data-action=edit]': 'handleEdit'
			'click': 'handleClick'

		# broadcast theme selection for all
		handleClick: (e) ->
			e.stopPropagation()
			$target = $(e.target).closest('.theme')
			app.vent.trigger 'theme:selected', $target.index()

		# open edit modal
		handleEdit: (e) ->
			e.stopPropagation()
			app.modal.show new EditThemeView
				theme: @model

		# This is a broadcast event that may have come from any theme.
		# If it was me then toggle otherwise turn off
		handleThemeSelection: (index) =>
			myIndex = @$el.index()
			if myIndex is index
				@$el.toggleClass 'selected'
			else
				@$el.removeClass 'selected'
