@Demo.module "WorkoutsApp", (WorkoutsApp, App, Backbone, Marionette, $, _) ->

	class WorkoutsApp.Router extends Marionette.AppRouter
		appRoutes:
			# "workouts/:id/edit" : "editWorkout"
			"workouts/:id/edit" : "listWorkoutsAndEdit"
			"workouts" : "listWorkouts"

	API =
		listWorkouts: ->
			WorkoutsApp.List.Controller.listWorkouts()

		listWorkoutsAndEdit: (id) ->
			WorkoutsApp.List.Controller.listWorkoutsAndEdit(id)

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

	App.vent.on "workout:cancelled", (workout) ->
		App.navigate Routes.workouts_path()
		API.listWorkouts()

	App.addInitializer ->
		new WorkoutsApp.Router
			controller: API