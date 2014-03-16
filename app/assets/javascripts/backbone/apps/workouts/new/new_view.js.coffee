@Demo.module "WorkoutsApp.New", (New, App, Backbone, Marionette, $, _) ->

	class New.Workout extends App.Views.ItemView
		template: "workouts/new/new_workout"
