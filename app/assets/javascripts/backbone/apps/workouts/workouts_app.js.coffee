@Demo.module "WorkoutsApp", (WorkoutsApp, App, Backbone, Marionette, $, _) ->

	class WorkoutsApp.Router extends Marionette.AppRouter
		appRoutes:
			"workouts" : "listWorkouts"

		API =
			listWorkouts: ->
				WorkoutsApp.List.Controller.listWorkouts()

		App.addInitializer ->
			new WorkoutsApp.Router
				controller: API