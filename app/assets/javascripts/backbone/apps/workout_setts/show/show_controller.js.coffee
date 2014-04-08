@Demo.module "WorkoutSettsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base

    initialize: (options) ->
      { sett, region } = options

      @layout = @getLayoutView sett

      exercise_options =
        region: @layout.showSubModelsRegion
        sett: sett

      @listenTo @layout, "show", =>
        @showDetails sett
        # App.execute "list:exercises"

      @show @layout

    getLayoutView: (sett) ->
      new Show.Layout

    getDetailsView: (sett) ->
      new Show.Sett
        model: sett

    showDetails: (sett) ->
      showDetailsView = @getDetailsView sett
      @layout.showModelRegion.show showDetailsView