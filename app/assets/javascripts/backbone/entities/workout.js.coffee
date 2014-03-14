@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Workout extends Entities.Model

	class Entities.WorkoutsCollection extends Entities.Collection
		model: Entities.Workout
		url: -> Routes.workouts_path()

	API =

		getWorkoutEntities: ->
			workouts = new Entities.WorkoutsCollection
			workouts.fetch()
			workouts

	App.reqres.setHandler "workout:entities", ->
		API.getWorkoutEntities()

