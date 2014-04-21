@Demo.module "WorkoutSettsApp.List", (List, App, Backbone, Marioette, $, _) ->

	class List.Layout extends App.Views.Layout
		# template: "workout_setts/list/layout"

		# regions:
      # settsRegion: "#setts-region"
      # listModelsRegion: "#list-models-region-setts"

  class List.LayoutEachModel extends App.Views.Layout
    template: "workout_setts/list/_layout_each_sett"
    className: "layout-each-sett"

    regions:
      listModelRegion: "#list-model-region-sett"
      listSubModelsRegion: "#list-sub-models-region-sett"

	class List.Sett extends App.Views.ItemView
		template: "workout_setts/list/_sett"

  class List.Setts extends App.Views.CompositeView
    template: "workout_setts/list/_setts"
    itemView: List.LayoutEachModel
    itemViewContainer: "#list-composite-view-setts"