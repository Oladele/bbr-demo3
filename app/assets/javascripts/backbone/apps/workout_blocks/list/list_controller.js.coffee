@Demo.module "WorkoutBlocksApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (options) ->

			workout = options.workout

			blocks = App.request "block:entities", workout

			#************NEED ACCESS TO REGION ELEMENMT IN BLOCKS VIEW******************
			# for block in blocks
			# 	options.region = ????
			# 	new App.WorkoutSetssApp.List sett_options


			@layout = @getLayoutView()

			@listenTo @layout, "show", =>
				@showBlocks blocks

			@show @layout

		getLayoutView : ->
			new List.Layout

		showBlocks: (blocks) ->
			blocksView = @getBlocksView blocks
			@layout.blocksRegion.show blocksView

		getBlocksView: (blocks) ->
			new List.Blocks
				collection: blocks
