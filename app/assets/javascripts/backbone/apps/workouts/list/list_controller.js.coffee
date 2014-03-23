@Demo.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listWorkouts: ->

			workouts = App.request "workout:entities"
			
			App.execute "when:fetched", workouts, =>
				@layout = @getLayoutView()
				@layout.on "show", =>
					@showPanel workouts
					@showWorkouts workouts
					@showDetails workouts

				App.mainRegion.show @layout

		listWorkoutsAndEdit: (id) ->
			
			workouts = App.request "workout:entities"

			# workout.on "updated", ->
				# App.vent.trigger "workout:updated", workout
				# console.log "LIST_CONTROLLER modelupdated"

			App.execute "when:fetched", workouts, =>
				workout = workouts.get(id:id)
				@layout = @getLayoutView()
				@layout.on "show", =>
					@showPanel workouts
					@showWorkouts workouts
					@showDetails workouts
					@editRegion workout

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

			newView.on "form:cancel", =>
				region.close()

			region.show newView

		editRegion: (workout) ->
			region = @layout.editRegion
			editView = App.request "edit:workout:view", workout

			editView.on "form:cancel workout:updated", =>
				region.close()

			region.show editView

		showWorkouts: (workouts) ->
			workoutsView = @getWorkoutsView workouts
			
			workoutsView.on "childview:edit:workout:button:clicked", (child, args)  =>
				@editRegion args.model #see comments below
				# App.vent.trigger "edit:workout:button:clicked", workout 
				#now args.model instead of workout since using "triggers:" instead of "events:" syntax in view

			workoutsView.on "childview:workout:delete", (child, args) ->
				model = args.model
				if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false

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
