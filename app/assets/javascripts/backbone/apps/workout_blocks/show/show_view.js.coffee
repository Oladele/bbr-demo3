@Demo.module "WorkoutBlocksApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "workout_blocks/show/layout"

    regions:
      showBlockRegion: "#show-block"

  class Show.Block extends App.Views.ItemView
    template: "workout_blocks/show/_block"