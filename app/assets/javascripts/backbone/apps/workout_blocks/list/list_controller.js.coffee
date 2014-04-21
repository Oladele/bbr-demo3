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
			subModel_options =
				region: childLayout.listSubModelsRegion
				block: childLayout.model
			@listModelRegion childLayout, subModel_options
			@listSubModelsRegion subModel_options if @options.showSubModels

		listModelRegion: (childLayout, subModel_options) ->
			listModelView = new List.Block(model: subModel_options.block)
			@listenTo listModelView, "expand:block:button:clicked", (e) ->
				# @listSubModelsRegion subModel_options
				@toggleSubModelsRegion subModel_options
			
			childLayout.listModelRegion.show( listModelView )

		listSubModelsRegion: (subModel_options) ->
			App.execute "show:block", subModel_options

		toggleSubModelsRegion: (subModel_options) ->
			if subModel_options.region.currentView
				subModel_options.region.reset()
			else
				App.execute "show:block", subModel_options