@Demo.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listWorkouts: ->
			workouts = App.request "workout:entities"

			@layout = @getLayoutView()

			@layout.on "show", =>
				@showPanel workouts
				@showWorkouts workouts

			App.mainRegion.show @layout

		showPanel: (workouts) ->
			panelView = @getPanelView workouts
			@layout.panelRegion.show panelView

		getPanelView: (workouts) ->
			new List.Panel
				collection: workouts

		showWorkouts: (workouts) ->
			workoutsView = @getWorkoutsView workouts
			@layout.workoutsRegion.show workoutsView

		getWorkoutsView: (workouts) ->
			new List.Workouts
				collection: workouts

		getLayoutView : ->
			new List.Layout
