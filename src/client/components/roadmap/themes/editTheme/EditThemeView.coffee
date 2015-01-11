define [
	'backbone', 'marionette', './editTheme.hbs', 'css!./editTheme.sass', 'stickit'
], (
	Backbone, Marionette, tpl
) ->

	class EditThemeView extends Marionette.ItemView
		template: tpl
		className: "edit-theme modal-dialog"

		bindings:
			'[name=name]': 'name'
			'[name=size]': 'size'

		events:
			'click [data-action=save]': 'handleSave'
			'click [data-action=delete]': 'handleDelete'

		initialize: (options) ->
			@theme = options.theme
			# copy to new model so we can cancel
			@model = new Backbone.Model
				name: @theme.get 'name'
				size: @theme.get 'size'

		onShow: ->
			@stickit()
			@$el.find('[name=name]').focus()

		handleSave: (e) ->
			@theme.set @model.toJSON()
			true

		handleDelete: (e) ->
			@theme.destroy()
			true
