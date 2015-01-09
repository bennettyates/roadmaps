# See http://lostechies.com/derickbailey/2012/04/17/managing-a-modal-dialog-with-backbone-and-marionette/

define ['marionette'], (Marionette) ->

	class ModalRegion extends Marionette.Region
		el: "#modal",

		constructor: ->
			_.bindAll @
			Marionette.Region.prototype.constructor.apply @, arguments
			@on "show", @showModal, @

		getEl: (selector) ->
			$el = $(selector)
			$el.on "hidden", this.close
			$el

		showModal: (view) ->
			view.on "close", @hideModal, @
			@$el.modal 'show'

		hideModal: ->
			@$el.modal 'hide'
