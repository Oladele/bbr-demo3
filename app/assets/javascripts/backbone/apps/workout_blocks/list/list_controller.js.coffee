@Demo.module "WorkoutBlocksApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (options) ->

			@options = options

			workout = @options.workout

			blocks = App.request "block:entities", workout

			# @layout = @getLayoutView()
			blocksView = @getBlocksView blocks

			# @listenTo @layout, "show", =>
			# 	@listBlocks blocks

			# @show @layout
			@show blocksView
			blocksView.children.each @handleChildLayout

		# getLayoutView : ->
		# 	new List.Layout

		# listBlocks: (blocks) ->
		# 	blocksView = @getBlocksView blocks

		# 	@layout.listModelsRegion.show blocksView

		# 	blocksView.children.each @handleChildLayout

		getBlocksView: (blocks) ->
			new List.Blocks
				collection: blocks

		handleChildLayout: (childLayout) =>
			@listModelRegion childLayout
			@listSubModelsRegion childLayout if @options.showSubModels

		listModelRegion: (childLayout) ->
			listModelView = new List.Block(model: childLayout.model)
			childLayout.listModelRegion.show( listModelView )

		listSubModelsRegion: (childLayout) ->
			options =
				region: childLayout.listSubModelsRegion
				block: childLayout.model
			App.execute "show:block", options