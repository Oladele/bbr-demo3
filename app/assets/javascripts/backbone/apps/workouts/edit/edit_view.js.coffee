@Demo.module "WorkoutsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	# class Edit.Layout extends App.Views.Layout
	# 	template: "workouts/edit/edit_layout"

	# 	regions:
	# 		formRegion: "#form-region"

	class Edit.Workout extends App.Views.ItemView
		template: "workouts/edit/edit_workout"

		# modelEvents:
		# 	"updated" : "modelUpdated"

		# modelUpdated: ->
		# 	# App.vent.trigger "updated"
		# 	console.log "EDIT_VIEW modelupdated"

		# onFormSubmit:(data) ->
		# 	console.log "Edit.Workouts onformSubmit", data
		# 	false

		# form:
		# 	footer: false
			# focusFirstInput: false
			# buttons: false
				# cancel: false
				# placement: "left"

		# triggers:
		# 	"click [data-form-button='cancel']" : "form:cancel"

		# No longer needed because of when:fetched implementation in List.Controller
		# modelEvents:
		# 	"sync" : "render"