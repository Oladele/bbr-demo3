@Demo.module "WorkoutsApp", (WorkoutsApp, App, Backbone, Marionette, $, _) ->

	class WorkoutsApp.Router extends Marionette.AppRouter
		appRoutes:
			"workouts" : "listWorkouts"

	API =
		listWorkouts: ->
			WorkoutsApp.List.Controller.listWorkouts()

		newWorkout: ->
			WorkoutsApp.New.Controller.newWorkout()

		editWorkout: (workout) ->
			WorkoutsApp.Edit.Controller.edit workout

	App.reqres.setHandler "new:workout:view", ->
		API.newWorkout()

	App.reqres.setHandler "edit:workout:view", (workout) ->
		API.editWorkout workout

	# App.vent.on "edit:workout:button:clicked", (workout) ->
	# 	API.editWorkout workout

	App.addInitializer ->
		new WorkoutsApp.Router
			controller: API