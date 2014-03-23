@Demo.module "WorkoutsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Workout extends App.Views.ItemView
		template: "workouts/show/show_workout"