@Demo.module "WorkoutRepsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Rep extends App.Views.ItemView
    template: "workout_reps/edit/edit_rep"