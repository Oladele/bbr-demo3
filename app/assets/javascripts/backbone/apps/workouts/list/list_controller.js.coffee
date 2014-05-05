@Demo.module "WorkoutsApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base	

		initialize: (options) ->

			user_id = options.user_id

			workouts = App.request "wod_prototype:entities", user_id
			
			App.execute "when:fetched", workouts, =>
				
				@layout = @getLayoutView()

				@listenTo @layout, "show", =>
					@showPanel workouts
					@listWorkouts workouts

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

		listWorkouts: (workouts) ->
			workoutsView = @getWorkoutsView workouts		

			@listenTo workoutsView, "childview:workout:delete", (child, args) ->
				model = args.model
				if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false

			@listenTo workoutsView, "childview:workout:glance", (child, args)  ->
			
				if child.$(".wod-tab.selected").length is 0
					child.$(".wod-tab").addClass("selected")
				else
					child.$(".wod-tab").removeClass("selected")
				@glanceDetails (args)

			@listenTo workoutsView, "childview:workout:copy", (e) ->
				e.model.deepCopy()
				App.vent.trigger "workout:created"

			@layout.workoutsRegion.show workoutsView

		getWorkoutsView: (workouts) ->
			new List.Workouts
				collection: workouts

		glanceDetails: (args) ->
			glanceView = @GetGlanceView args.model

			@listenTo glanceView, "show:workout:button:clicked", (args)  ->
				@showDetails args.model

			if (args.view).glanceRegion.currentView
				(args.view).glanceRegion.reset()
			else
				(args.view).glanceRegion.show glanceView

		showDetails: (workout) ->
			options =
				region: @layout.detailsRegion
				wod_prototype: workout
			App.execute "show:workout", options

		getLayoutView : ->
			new List.Layout

		GetGlanceView: (workout) ->
			new List.Glance
				model: workout