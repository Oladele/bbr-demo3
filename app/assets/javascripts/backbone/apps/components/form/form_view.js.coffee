@Demo.module "Components.Form", (Form, App, Backbone, Marionette, $, _) ->

	class Form.FormWrapper extends App.Views.Layout
		template: "form/form"

		tagName: "form"
		attributes: ->
			"data-type": @getFormDataType()

		regions:
			formContentRegion: "#form-content-region"

		ui:
			buttonContainer: "div.buttons-group"

		triggers:
			"submit" : "form:submit"

		modelEvents:
			"change:_errors" : "changeErrors"

		initialize: ->
			@setInstancePropertiesFor "config", "buttons"

		serializeData: ->
			footer: @config.footer
			buttons: @buttons?.toJSON() ? false

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
			console.log "hello from removeErrors"
			$(".form-group").removeClass("has-error").find("small").remove()
			console.log $(".form-group")

		addErrors: (errors = {})->
			for name, array of errors
				@addError name, array[0]

		addError: (name, error) ->
			el = @$("[name='#{name}']")
			sm = $("<small>").text(error)
			sm.addClass("input-error-msg")
			el.after(sm).closest(".form-group").addClass("has-error")