@Demo.module "WorkoutsApp", (WorkoutsApp, App, Backbone, Marionette, $, _) ->

	class WorkoutsApp.Router extends Marionette.AppRouter
		appRoutes:
			# "workouts/:id/edit" : "editWorkout"
			"workouts/:id" : "listWorkoutsAndDetails"
			"workouts/:id/edit" : "listWorkoutsAndEdit"
			"workouts" : "listWorkouts"

	API =
		listWorkouts: (options) ->
			# WorkoutsApp.List.Controller.listWorkouts()
			new WorkoutsApp.List.Controller options

		listWorkoutsAndEdit: (id) ->
			@listWorkouts (edit_id:id)

		listWorkoutsAndDetails: (id) ->
			@listWorkouts (show_id:id)

		newWorkout: (region) ->
			# WorkoutsApp.New.Controller.newWorkout()
			# new WorkoutsApp.New.Controller
			# new WorkoutsApp.New.Controller().formView #TAKE TWO
			new WorkoutsApp.New.Controller
				region: region

		editWorkout: (id, workout, region) ->
			# WorkoutsApp.Edit.Controller.edit id, workout
			new WorkoutsApp.Edit.Controller
				id: id
				workout: workout
				region: region

		showWorkout: (id, workout, region) ->
			new WorkoutsApp.Show.Controller
				id: id
				workout: workout
				region: region

	# App.reqres.setHandler "new:workout:view", ->
	# 	API.newWorkout()
	# REPLACED with below

	App.commands.setHandler "new:workout", (options) ->
		API.newWorkout options.region

	App.reqres.setHandler "edit:workout:view", (workout) ->
		App.navigate Routes.edit_workout_path(workout.id)
		API.editWorkout workout.id, workout

	App.commands.setHandler "edit:workout", (options) ->
		App.navigate Routes.edit_workout_path(options.workout.id)
		API.editWorkout options.workout.id, options.workout, options.region

	App.commands.setHandler "workout:details", (options) ->
		# App.navigate Routes.workout_path(1)
		# App.navigate Routes.workout_path(options.workout.id)
		API.showWorkout options.workout.id, options.workout, options.region

	# App.vent.on "edit:workout:button:clicked", (workout) ->
	# 	API.editWorkout workout

	App.vent.on "workout:cancelled workout:updated", (workout) ->
		App.navigate Routes.workouts_path()
		# API.listWorkouts()

	App.vent.on "workout:created", (workout) ->
		App.navigate Routes.workouts_path()
		API.listWorkouts()

	App.addInitializer ->
		new WorkoutsApp.Router
			controller: API