@Demo.module "WorkoutBlocksApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (options) ->

			@options = options

			workout = @options.workout

			blocks = App.request "block:entities", workout

			App.execute "when:fetched", blocks, =>

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
			
			@listenTo listModelView, "expand:block:button:clicked", ->
				console.log "listenTo expandBlock(subModel_options)", subModel_options
				window.temp_subModel_options = subModel_options
				@toggleSubModelsRegion subModel_options
			
			@listenTo listModelView, "delete:block:button:clicked", ->
				@deleteBlock listModelView.model

			childLayout.listModelRegion.show( listModelView )

		listSubModelsRegion: (subModel_options) ->
			App.execute "show:block", subModel_options

		toggleSubModelsRegion: (subModel_options) ->
			if subModel_options.region.currentView
				subModel_options.region.reset()
			else
				App.execute "show:block", subModel_options

		deleteBlock: (model) ->
			if confirm "Are you sure you want to delete #{model.get("name")}?" then model.destroy() else false