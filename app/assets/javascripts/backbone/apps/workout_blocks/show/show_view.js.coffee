@Demo.module "WorkoutBlocksApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Block extends App.Views.ItemView
    template: "workout_blocks/show/_block"