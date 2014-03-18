@Demo.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listWorkouts: (id) ->
			workouts = App.request "workout:entities"
			workout = App.request("workout:entity", id)

			@layout = @getLayoutView()

			@layout.on "show", =>
				@showPanel workouts
				# @newRegion() don't show on load
				# @editRegion() don't show on load
				@editRegion workout
				@showWorkouts workouts
				@showDetails workouts

			App.mainRegion.show @layout

		showPanel: (workouts) ->
			panelView = @getPanelView workouts

			panelView.on "new:workout:button:clicked", =>
				@newRegion()
			@layout.panelRegion.show panelView

		getPanelView: (workouts) ->
			new List.Panel
				collection: workouts

		newRegion: ->
			region = @layout.newRegion
			newView = App.request "new:workout:view"

			newView.on "form:cancel:button:clicked", =>
				region.close()

			region.show newView

		editRegion: (workout) ->
			region = @layout.editRegion
			editView = App.request "edit:workout:view", workout

			editView.on "form:cancel:button:clicked", =>
				region.close()

			region.show editView

		showWorkouts: (workouts) ->
			workoutsView = @getWorkoutsView workouts
			
			workoutsView.on "childview:edit:workout:button:clicked", (child, workout)  =>
				@editRegion workout
				# App.vent.trigger "edit:workout:button:clicked", workout

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
