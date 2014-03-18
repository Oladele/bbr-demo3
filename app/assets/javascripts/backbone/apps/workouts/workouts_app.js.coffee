@Demo.module "WorkoutsApp", (WorkoutsApp, App, Backbone, Marionette, $, _) ->

	class WorkoutsApp.Router extends Marionette.AppRouter
		appRoutes:
			# "workouts/:id/edit" : "editWorkout"
			"workouts/:id/edit" : "listWorkouts"
			"workouts" : "listWorkouts"

	API =
		listWorkouts: (id) ->
			WorkoutsApp.List.Controller.listWorkouts(id)

		newWorkout: ->
			WorkoutsApp.New.Controller.newWorkout()

		editWorkout: (id, workout) ->
			WorkoutsApp.Edit.Controller.edit id, workout

	App.reqres.setHandler "new:workout:view", ->
		API.newWorkout()

	App.reqres.setHandler "edit:workout:view", (workout) ->
		App.navigate Routes.edit_workout_path(workout.id)
		API.editWorkout workout.id, workout

	# App.vent.on "edit:workout:button:clicked", (workout) ->
	# 	API.editWorkout workout

	App.addInitializer ->
		new WorkoutsApp.Router
			controller: API