@Demo.module "WorkoutSettsApp.Show", (Show, App, Backbone, Marioette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "workout_setts/show/layout"

    regions:
      showModelRegion: "#show-model-region-sett"
      showSubModelsRegion: "#show-sub-models-region-sett"

  class Show.Sett extends App.Views.ItemView
    template: "workout_setts/show/_sett"