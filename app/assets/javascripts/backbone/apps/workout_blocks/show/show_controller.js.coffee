@Demo.module "WorkoutBlocksApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Controller extends App.Controllers.Base

		initialize: (options) ->
      { block, region } = options
      
      @layout = @getLayoutView block
      
      @listenTo @layout, "show", =>
        @showDetails block
      
      @show @layout

		getLayoutView: (block) ->
      new Show.Layout

    showDetails: (block) ->
      showDetailsView = @getDetailsView block
      @layout.showBlockRegion.show showDetailsView

    getDetailsView: (block) ->
      new Show.Block
        model: block

