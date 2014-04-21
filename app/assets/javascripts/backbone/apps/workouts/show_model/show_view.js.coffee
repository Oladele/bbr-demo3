@Demo.module "WorkoutsApp.ShowTopModel", (ShowTopModel, App, Backbone, Marionette, $, _) ->

  class ShowTopModel.Workout extends App.Views.ItemView
    template: "workouts/show_model/_workout"

    triggers:
      "click .edit-workout"   : "edit:workout:button:clicked"
      # "dblclick"              : "edit:workout:doubleclicked"

    modelEvents:
      "updated" : "modelUpdated"

    modelUpdated: =>
      @render()