@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Workout extends Entities.Model
		urlRoot: ->Routes.workouts_path()

	class Entities.WorkoutsCollection extends Entities.Collection
		model: Entities.Workout
		url: -> Routes.workouts_path()

	API =

		getWorkoutEntities: ->
			workouts = new Entities.WorkoutsCollection
			workouts.fetch
				reset: true
			workouts

		getWorkoutEntity: (id) ->
			workout = new Entities.Workout
				id: id
			workout.fetch
				reset:true
			workout

	App.reqres.setHandler "workout:entities", ->
		API.getWorkoutEntities()

	App.reqres.setHandler "workout:entity", (id) ->
		API.getWorkoutEntity id
