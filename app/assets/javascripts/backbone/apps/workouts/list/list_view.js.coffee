@Demo.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "workouts/list/list_layout"

		regions:
			panelRegion: "#panel-region"
			newRegion: "#new-region"
			editRegion: "#new-region" #uses same region as 'new'
			workoutsRegion: "#workouts-region"
			detailsRegion: "#details-region"

	class List.Panel extends App.Views.ItemView
		template: "workouts/list/_panel"

		triggers:
			"click #new-workout" : "new:workout:button:clicked"

	class List.Workout extends App.Views.ItemView
		template: "workouts/list/_workout"
		tagName: "li"

		modelEvents:
			"updated" : "modelUpdated"

		modelUpdated: ->
			# App.vent.trigger "updated"
			console.log "List_VIEW modelupdated"

		events:
			"click #edit-workout" : -> @trigger "edit:workout:button:clicked", @model
		# triggers:
		# 	"click #edit-workout" : "new:workout:button:clicked"

	class List.Workouts extends App.Views.CompositeView
		template: "workouts/list/_workouts"
		itemView: List.Workout
		itemViewContainer: "ul"

	class List.Detail extends App.Views.ItemView
		template: "workouts/list/_detail"

	class List.Details extends App.Views.CompositeView
		template: "workouts/list/_details"
		itemView: List.Detail
		itemViewContainer: "#wod-details"
