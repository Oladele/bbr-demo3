@Demo.module "WorkoutBlocksApp.List", (List, App, Backbone, Marionette, $, _) ->

	# class List.Layout extends App.Views.Layout
	# 	template: "workout_blocks/list/layout"

	# 	regions:
	# 		listModelsRegion: "#list-models-region-blocks"

	class List.LayoutEachModel extends App.Views.Layout
		template: "workout_blocks/list/_layout_each_block"
		className: "layout-each-block"

		regions:
			listModelRegion: "#list-model-region-block"
			listSubModelsRegion: "#list-sub-models-region-block"

	class List.Block extends App.Views.ItemView
		template: "workout_blocks/list/_block"

		events:
			"click #toggler"   : "toggleExpand"

		toggleExpand: (e) ->
			console.log 'clicked me', e
			$(e.target).toggleClass 'glyphicon glyphicon-chevron-right'
			$(e.target).toggleClass 'glyphicon glyphicon-chevron-down'
			@triggerMethod 'expand:block:button:clicked'
			# @$el.toggleClass 'glyphicon-collapse-down'


		triggers:
			"click .delete-block"   : "delete:block:button:clicked"

	class List.Blocks extends App.Views.CompositeView
		template: "workout_blocks/list/_blocks"
		itemView: List.LayoutEachModel
		itemViewContainer: "#list-composite-view-blocks"