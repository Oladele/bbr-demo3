@Demo.module "WorkoutRepsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Layout extends App.Views.Layout
    template: "workout_reps/list/layout"

    regions:
      # repsRegion: "#reps-region"
      listModelsRegion: "#list-models-region-reps"
      listModelsDialogRegion: "#list-models-dialog-region-rep"

  class List.LayoutEachModel extends App.Views.Layout
    template: "workout_reps/list/_layout_each_rep"
    className: "layout-each-rep"
    tagName: "span"

    regions:
      listModelRegion: "#list-model-region-rep"
      listSubModelsRegion: "#list-sub-models-region-rep"

    triggers:
      "click" : "edit:rep:clicked"

  class List.Rep extends App.Views.ItemView
    template: "workout_reps/list/_rep"
    tagName: "span"

    # triggers:
    #   "click" : "edit:rep:clicked"

    modelEvents:
      "updated" : "render"

  class List.Reps extends App.Views.CompositeView
    template: "workout_reps/list/_reps"
    itemView: List.LayoutEachModel
    itemViewContainer: "#list-composite-view-reps"