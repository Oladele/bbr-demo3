@Demo.module "WorkoutsApp", (WorkoutsApp, App, Backbone, Marionette, $, _) ->

	class WorkoutsApp.Router extends Marionette.AppRouter
		appRoutes:
			"workouts/:id/edit" : "showWorkout"
			"workouts/:id" : "showWorkout"
			"users/:user_id/workouts" : "listWorkouts"

	API =
		listWorkouts: (user_id) ->
			options =
				user_id: user_id
			new WorkoutsApp.List.Controller options

		newWorkout: (region) ->
			new WorkoutsApp.New.Controller
				region: region

		editWorkout: (id, workout, region) ->
			new WorkoutsApp.Edit.Controller
				id: id
				workout: workout
				region: region

		showWorkout: (id) ->
			options = 
				id:id
			new WorkoutsApp.Show.Controller options

		showWorkoutTopModel: (options) ->
			new WorkoutsApp.ShowTopModel.Controller options

	App.commands.setHandler "new:workout", (options) ->
		API.newWorkout options.region

	App.reqres.setHandler "edit:workout:view", (workout) ->
		App.navigate Routes.edit_workout_path(workout.id)
		API.editWorkout workout.id, workout

	App.commands.setHandler "edit:workout", (options) ->
		API.editWorkout options.workout.id, options.workout, options.region

	App.commands.setHandler "show:workout", (options) ->
		App.navigate Routes.workout_path(options.wod_prototype.id)
		API.showWorkout options.wod_prototype.id

	App.commands.setHandler "show:workout:top_model", (options) ->
		API.showWorkoutTopModel options

	App.vent.on "workout:cancelled workout:updated", (options) ->
		App.navigate Routes.workout_path(options.workout.id)
		API.showWorkoutTopModel options

	App.vent.on "workout:created", (workout) ->
		App.navigate Routes.user_workouts_path(App.currentUser.id)
		API.listWorkouts(App.currentUser.id)

	App.addInitializer ->
		new WorkoutsApp.Router
			controller: API