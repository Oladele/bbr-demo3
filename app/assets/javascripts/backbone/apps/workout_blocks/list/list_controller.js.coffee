@Demo.module "WorkoutBlocksApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (options) ->

			workout = options.workout

			blocks = App.request "block:entities", workout

			@layout = @getLayoutView()

			@listenTo @layout, "show", =>
				@listBlocks blocks

			@show @layout

		getLayoutView : ->
			new List.Layout

		listBlocks: (blocks) ->
			blocksView = @getBlocksView blocks

			@layout.blocksRegion.show blocksView

			blocksView.children.each @handleItemLayout

		getBlocksView: (blocks) ->
			new List.Blocks
				collection: blocks

		handleItemLayout: (itemLayout) =>
			@handleItemListRegion itemLayout
			@handleItemShowRegion itemLayout

		handleItemListRegion: (itemLayout) ->
			listItemView = new List.Block(model: itemLayout.model)
			itemLayout.listItemRegion.show( listItemView )

		handleItemShowRegion: (itemLayout) ->
			options =
				region: itemLayout.showItemRegion
				block: itemLayout.model
			App.execute "show:block", options