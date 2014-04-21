@Demo.module "WorkoutsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Layout extends App.Views.Layout
		template: "workouts/show/layout"

		regions:
      showModelRegion: "#show-model-region-workout"
      # initial inline edit implementation:
      showModelEditRegion: "#show-model-edit-region-workout"
      showSubModelsRegion: "#show-sub-models-region-workout"

  class Show.Workout extends App.Views.Layout
    template: "workouts/show/_workout"

    regions:
      editRegion: "#edit-region"

    triggers:
      "click .edit-workout"   : "edit:workout:button:clicked"
      # "dblclick"              : "edit:workout:doubleclicked"

    modelEvents:
      "updated" : "modelUpdated"

    modelUpdated: =>
      @render()