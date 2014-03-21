@Demo.module "WorkoutsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Layout extends App.Views.Layout
		template: "workouts/edit/edit_layout"

		regions:
			formRegion: "#form-region"

	class Edit.Workout extends App.Views.ItemView
		template: "workouts/edit/edit_workout"

		# form:
			# footer: false
			# focusFirstInput: false
			# buttons: false
				# cancel: false
				# placement: "left"

	# 	triggers:
	# 		"click [data-form-button='cancel']" : "form:cancel:button:clicked"

		# No longer needed because of when:fetched implementation in List.Controller
		# modelEvents:
		# 	"sync" : "render"