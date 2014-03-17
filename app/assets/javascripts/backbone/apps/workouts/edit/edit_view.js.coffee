@Demo.module "WorkoutsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Workout extends App.Views.ItemView
		template: "workouts/new/new_workout"

		triggers:
			"click [data-form-button='cancel']" : "form:cancel:button:clicked"