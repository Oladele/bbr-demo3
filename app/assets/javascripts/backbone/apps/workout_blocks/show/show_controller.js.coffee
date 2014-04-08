@Demo.module "WorkoutBlocksApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Controller extends App.Controllers.Base

		initialize: (options) ->
      { block, region } = options
      
      @layout = @getLayoutView block

      setts_options =
        region: @layout.showSubModelsRegion
        block: block
      
      @listenTo @layout, "show", =>
        @showDetails block
        App.execute "list:setts", setts_options
      
      @show @layout

		getLayoutView: (block) ->
      new Show.Layout

    getDetailsView: (block) ->
      new Show.Block
        model: block

    showDetails: (block) ->
      showDetailsView = @getDetailsView block
      @layout.showModelRegion.show showDetailsView


