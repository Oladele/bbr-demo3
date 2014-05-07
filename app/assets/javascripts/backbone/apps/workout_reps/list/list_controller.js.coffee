@Demo.module "WorkoutRepsApp.List", (List, App, Backbone, Marionette, $, _) ->

  class List.Controller extends App.Controllers.Base

    initialize: (options) ->
      
      sett = options.sett

      reps = App.request "rep:entities", sett
      window.temp_repsCollection = reps

      @layout = @getLayoutView()

      @listenTo @layout, "show", =>
        @listReps reps

      @show @layout

    getLayoutView: ->
      new List.Layout

    listReps: (reps) ->
      repsView = @getRepsView reps

      @listenTo repsView, "childview:edit:rep:clicked", (e) ->
        console.log 'clicked child rep (e):', e
        edit_options =
          rep: e.model
          region: @layout.listModelsDialogRegion
        App.execute "edit:rep", edit_options

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

      # @listenTo listModelView, "edit:rep:clicked", (e) ->
      #   console.log 'clicked rep (e):', e

      layout.listModelRegion.show( listModelView )

    # listSubModelsRegion: (layout) ->
    #   options =
    #     region: layout.listSubModelsRegion
    #     sett: layout.model
    #   App.execute "show:sett", options