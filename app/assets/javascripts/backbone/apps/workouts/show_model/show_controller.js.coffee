@Demo.module "WorkoutsApp.ShowTopModel", (ShowTopModel, App, Backbone, Marionette, $, _) ->

  class ShowTopModel.Controller extends App.Controllers.Base

    initialize: (options) ->
      { workout, id, region } = options

      @options = options

      workout or= App.request "workout:entity", id

      App.execute "when:fetched", workout, =>
        
        @options.workout = workout

        workoutView = @getWorkoutView workout

        @listenTo workoutView, "edit:workout:button:clicked", (args)  =>
          console.warn "TOP MODEL @OPTIONS", @options
          App.execute "edit:workout", @options

        @show workoutView

    getWorkoutView: (workout) ->
      new ShowTopModel.Workout
        model: workout