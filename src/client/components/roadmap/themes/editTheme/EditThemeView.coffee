define ['marionette', './editTheme.hbs', 'css!./editTheme.sass'], (Marionette, tpl) ->

	class EditThemeView extends Marionette.ItemView
		template: tpl
		className: "edit-theme"
