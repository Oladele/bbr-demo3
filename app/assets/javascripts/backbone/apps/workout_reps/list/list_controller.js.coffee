@Demo.module "WorkoutRepsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      
      sett = options.sett

      reps = App.request "rep:entities", sett

      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
        @listReps reps

      @show @layout

    getLayoutView: ->
      new List.Layout

    listReps: (reps) ->
      repsView = @getRepsView reps

      @layout.listModelsRegion.show repsView

      repsView.children.each @handleLayout

    getRepsView: (reps) ->
      new List.Reps
        collection: reps

    handleLayout: (layout) =>
      @listModelRegion layout
      #@listModelRegion layout
      # @listSubModelsRegion layout

    listModelRegion: (layout) ->
      listModelView = new List.Rep(model: layout.model)
      layout.listModelRegion.show( listModelView )

    # listSubModelsRegion: (layout) ->
    #   options =
    #     region: layout.listSubModelsRegion
    #     sett: layout.model
    #   App.execute "show:sett", options