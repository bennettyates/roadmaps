define [
	'backbone', 'marionette', './editTheme.hbs', 'css!./editTheme.sass', 'stickit'
], (
	Backbone, Marionette, tpl
) ->

	class EditThemeView extends Marionette.ItemView
		template: tpl
		className: "edit-theme"

		bindings:
			'[name=name]': 'name'
			'[name=size]': 'size'

		events:
			'submit form': 'handleSave'
			'click [data-action=delete]': 'handleDelete'

		initialize: (options) ->
			@theme = options.theme
			@model = new Backbone.Model
				name: @theme.get 'name'
				size: @theme.get 'size'

		onShow: ->
			@stickit()

		handleSave: (e) ->
			console.log e
			e.stopPropagation()
			@theme.set @model.toJSON()
			console.log @theme.toJSON()
			# app.modal.reset()

		handleDelete: ->
			console.log e
			e.stopPropagation()
			@theme.destory()
			app.modal.reset()
