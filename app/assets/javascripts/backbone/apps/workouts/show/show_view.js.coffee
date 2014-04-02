@Demo.module "WorkoutsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Layout extends App.Views.Layout
		template: "workouts/show/show_layout"

		regions:
			detailsRegionContents: "#details-region-contents"

	class Show.Workout extends App.Views.ItemView
		template: "workouts/show/show_workout"