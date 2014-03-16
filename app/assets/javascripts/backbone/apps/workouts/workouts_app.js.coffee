@Demo.module "WorkoutsApp", (WorkoutsApp, App, Backbone, Marionette, $, _) ->

	class WorkoutsApp.Router extends Marionette.AppRouter
		appRoutes:
			"workouts" : "listWorkouts"

	API =
		listWorkouts: ->
			WorkoutsApp.List.Controller.listWorkouts()

		newWorkout: ->
			WorkoutsApp.New.Controller.newWorkout()

	App.reqres.setHandler "new:workout:view", ->
		API.newWorkout()

	App.addInitializer ->
		new WorkoutsApp.Router
			controller: API