@Demo.module "WorkoutsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Layout extends App.Views.Layout
		template: "workouts/show/layout"

		regions:
      showModelRegion: "#show-model-region-workout"
      showSubModelsRegion: "#show-sub-models-region-workout"

	class Show.Workout extends App.Views.ItemView
		template: "workouts/show/_workout"