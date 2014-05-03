@Demo.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "workouts/list/layout"

		regions:
			panelRegion: "#panel-region"
			newRegion: "#new-region"
			# editRegion: "#new-region" #uses same region as 'new'
			workoutsRegion: "#workouts-region"
			glanceDetailsRegion: "#glance-details-region"

	class List.Panel extends App.Views.ItemView
		template: "workouts/list/_panel"

		triggers:
			"click #new-workout" : "new:workout:button:clicked"

	class List.Workout extends App.Views.Layout
		template: "workouts/list/_workout"
		tagName: "li"

		regions:
			glanceRegion: ".glance-region"
			# editRegion: "#edit-region"

		triggers:
			"click" 								: "workout:glance"
			"click .delete-workout" : "workout:delete"
			"click .copy-workout" 	: "workout:copy"

		modelEvents:
			"updated" : "modelUpdated"

		modelUpdated: =>
			@render()

	class List.Workouts extends App.Views.CompositeView
		template: "workouts/list/_workouts"
		itemView: List.Workout
		itemViewContainer: "ul"

	class List.Glance extends App.Views.ItemView
		template: "workouts/list/_glance"

		triggers:
			"click #show-workout" : "show:workout:button:clicked"
