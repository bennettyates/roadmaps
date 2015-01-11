define ['marionette', './modal.hbs', 'css!./modal.sass'], (Marionette, tpl) ->

	class ModalView extends Marionette.LayoutView
		template: tpl
		className: "modal-dialog"
