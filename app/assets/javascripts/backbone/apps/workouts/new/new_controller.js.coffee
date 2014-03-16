@Demo.module "WorkoutsApp.New", (New, App, Backbone, Marionette, $, _) ->

	New.Controller =

		newWorkout: ->
			newView = @getNewView()

			newView

		getNewView: ->
			new New.Workout
