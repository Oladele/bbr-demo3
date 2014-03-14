@Demo.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "workouts/list/templates/list_layout"

		regions:
			panelRegion: "#panel-region"
			workoutsRegion: "#workouts-region"

	class List.Panel extends App.Views.ItemView
		template: "workouts/list/templates/_panel"

	class List.Workout extends App.Views.ItemView
		template: "workouts/list/templates/_workout"
		tagName: "li"

	class List.Workouts extends App.Views.CompositeView
		template: "workouts/list/templates/_workouts"
		itemView: List.Workout
		itemViewContainer: "ul"
