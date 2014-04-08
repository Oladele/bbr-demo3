@Demo.module "WorkoutBlocksApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Controller extends App.Controllers.Base

		initialize: (options) ->
      { block, region } = options
      @layout = @getLayoutView block
      @show @layout

		getLayoutView: (block) ->
      new Show.Block
        model: block


