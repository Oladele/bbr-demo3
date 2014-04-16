@Demo.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base	

		initialize: (options) ->

			workouts = App.request "workout:entities"
			
			App.execute "when:fetched", workouts, =>
				workout = workouts.get(id:options.edit_id) if options.edit_id
				workout = workouts.get(id:options.show_id) if options.show_id
				
				@layout = @getLayoutView()

				@listenTo @layout, "show", =>
					@showPanel workouts
					@listWorkouts workouts
					@showDetails workout if options.show_id
					@editRegion workout if options.edit_id

				@show @layout

		onClose: ->

		showPanel: (workouts) ->
			panelView = @getPanelView workouts

			@listenTo panelView, "new:workout:button:clicked", =>
				@newRegion()
			@layout.panelRegion.show panelView

		getPanelView: (workouts) ->
			new List.Panel
				collection: workouts

		newRegion: ->

			options = {}
			options.region = @layout.newRegion

			App.execute "new:workout", options

		editRegion: (workout) ->

			options = {}
			options.region = @layout.editRegion
			options.workout = workout
			App.execute "edit:workout", options

		listWorkouts: (workouts) ->
			workoutsView = @getWorkoutsView workouts
			
			@listenTo workoutsView, "childview:edit:workout:button:clicked", (child, args)  =>
				@editRegion args.model

			@listenTo workoutsView, "childview:workout:delete", (child, args) ->
				model = args.model
				if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false

			@listenTo workoutsView, "childview:workout:glance", (child, args)  ->
				# @showDetails (args.model)
				@glanceDetails (args.model)
				workoutsView.$(".wod-tab").removeClass("selected")
				child.$(".wod-tab").addClass("selected")

			@layout.workoutsRegion.show workoutsView

		getWorkoutsView: (workouts) ->
			new List.Workouts
				collection: workouts

		glanceDetails: (workout) ->
			glanceView = @GetGlanceView workout

			@listenTo glanceView, "show:workout:button:clicked", (args)  ->
				console.log 'show button clicked, args:', args
				@showDetails args.model

			@layout.glanceDetailsRegion.show glanceView
			# options =
			# 	region: @layout.detailsRegion
			# 	workout: workout
			# new App.WorkoutsApp.Show.Controller options
			# App.execute "workout:details", options

		showDetails: (workout) ->
			options =
				region: @layout.detailsRegion
				workout: workout
			# new App.WorkoutsApp.Show.Controller options
			App.execute "show:workout", options

		getLayoutView : ->
			new List.Layout

		GetGlanceView: (workout) ->
			new List.Glance
				model: workout