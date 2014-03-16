@Demo.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listWorkouts: ->
			App.request "workout:entities", (workouts) =>

				@layout = @getLayoutView()

				@layout.on "show", =>
					@showPanel workouts
					@newRegion()
					@showWorkouts workouts
					@showDetails workouts

				App.mainRegion.show @layout

		showPanel: (workouts) ->
			panelView = @getPanelView workouts
			@layout.panelRegion.show panelView

		getPanelView: (workouts) ->
			new List.Panel
				collection: workouts

		newRegion: ->
			newView = App.request "new:workout:view"
			@layout.newRegion.show newView

		showWorkouts: (workouts) ->
			workoutsView = @getWorkoutsView workouts
			@layout.workoutsRegion.show workoutsView

		getWorkoutsView: (workouts) ->
			new List.Workouts
				collection: workouts

		showDetails: (workouts) ->
			detailsView = @getDetailsView workouts
			@layout.detailsRegion.show detailsView

		getDetailsView: (workouts) ->
			new List.Details
				collection: workouts

		getLayoutView : ->
			new List.Layout
