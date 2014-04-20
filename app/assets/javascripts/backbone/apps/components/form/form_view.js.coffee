@Demo.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

	class Form.FormWrapper extends App.Views.Layout
		template: "form/form"

		tagName: "form"
		attributes: ->
			"data-type": @getFormDataType()

		regions:
			formContentRegion: "#form-content-region"

		events:
			"keydown #form-content-region"	: "keydownHandler"

		ui:
			buttonContainer: "div.buttons-group"

		triggers:
			"submit" 														: "form:submit"
			"click [data-form-button='cancel']" : "form:cancel"

		modelEvents:
			"change:_errors" 	: "changeErrors"
			"sync:start"			: "syncStart"
			"sync:stop"				: "syncStop"

		initialize: ->
			@setInstancePropertiesFor "config", "buttons"

		serializeData: ->
			footer: @config.footer
			buttons: @buttons?.toJSON() ? false

		keydownHandler: (e) ->
			@trigger 'form:cancel' if e.keyCode is 27

		onShow: ->
			_.defer =>
				@focusFirstInput() if @config.focusFirstInput
				@buttonPlacement() if @buttons

		buttonPlacement: ->
			@ui.buttonContainer.addClass ("pull-"+@buttons.placement)

		focusFirstInput: =>
			@$(":input:visible:enabled:first").focus()

		getFormDataType: ->
			if @model.isNew() then "new" else "edit"

		changeErrors: (model, errors, options) ->
			console.log "_errors changed", errors
			if @config.errors
				if _.isEmpty(errors) then @removeErrors() else @addErrors errors

		removeErrors: ->
			$(".form-group").removeClass("has-error").find("small").remove()

		addErrors: (errors = {})->
			for name, array of errors
				@addError name, array[0]

		addError: (name, error) ->
			el = @$("[name='#{name}']")
			sm = $("<small>").text(error)
			sm.addClass("input-error-msg")
			el.after(sm).closest(".form-group").addClass("has-error")

		syncStart: (model) ->
			@$el.addClass("opacity") if @config.syncing
			# @addOpacityWrapper() if @config.syncing
			# JQUERY NOT WORKING WITH CHROME AND OPACITY NOT CLEARING AFTER SYNC

		syncStop: (model) ->
			@$el.removeClass("opacity") if @config.syncing
			# @addOpacityWrapper(false) if @config.syncing
			# JQUERY NOT WORKING WITH CHROME AND OPACITY NOT CLEARING AFTER SYNC