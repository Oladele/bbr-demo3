@Demo.module "WorkoutSettsApp.List", (List, App, Backbone, Marioette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "workout_setts/list/list_layout"

		regions:
			settsRegion: "#setts-region"

	class List.Sett extends App.Views.ItemView
		template: "workout_setts/list/_sett"

	class List.Setts extends App.Views.CompositeView
		template: "workout_setts/list/_setts"