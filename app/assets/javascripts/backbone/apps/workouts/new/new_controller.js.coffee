@Demo.module "WorkoutsApp.New", (New, App, Backbone, Marionette, $, _) ->

	New.Controller =

		newWorkout: ->
			workout = App.request "new:workout:entity"

			workout.on "created", ->
				App.vent.trigger "workout:created", workout
				
			newView = @getNewView workout

			App.request "form:wrapper", newView

		getNewView: (workout) ->
			new New.Workout
				model: workout
