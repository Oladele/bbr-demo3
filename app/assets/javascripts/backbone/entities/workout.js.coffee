@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Workout extends Entities.Model

	class Entities.WorkoutsCollection extends Entities.Collection
		model: Entities.Workout
		url: -> Routes.workouts_path()

	API =

		getWorkoutEntities: (cb) ->
			workouts = new Entities.WorkoutsCollection
			workouts.fetch
				success: ->
					cb workouts

	App.reqres.setHandler "workout:entities", (cb) ->
		API.getWorkoutEntities cb

