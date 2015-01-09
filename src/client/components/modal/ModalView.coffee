define ['marionette', './modal.hbs', 'css!./modal.sass'], (Marionette, tpl) ->

	class ModalView extends Marionette.LayoutView
		template: tpl
		className: "modal-dialog"
		regions:
			body: ".modal-body"
		templateHelpers: ->
			title: @title
		initialize: (options) ->
			@title = options.title
