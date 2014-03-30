@Demo.module "WorkoutBlocksApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (workout) ->

			blocks = App.request "block:entities", workout

			@layout = @getLayoutView()

			@listenTo @layout, "show", =>
				@showBlocks blocks

			@show @layout

		getLayoutView : ->
			new List.Layout

		showBlocks: (blocks) ->
			blocksView = @getBlocksView blocks

		getBlocksView: (blocks) ->
			new List.Blocks
				collection: blocks
