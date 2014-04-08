@Demo.module "WorkoutBlocksApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "workout_blocks/show/layout"

    regions:
      showModelRegion: "#show-model-region-block"
      showSubModelsRegion: "#show-sub-models-region-block"

  class Show.Block extends App.Views.ItemView
    template: "workout_blocks/show/_block"