@Demo.module "WorkoutBlocksApp", (WorkoutBlocksApp, App, Backbone, Marionette, $, _) ->

	API =
		listBlocks: (options) ->
      new WorkoutBlocksApp.List.Controller options

    showBlock: (options) ->
      new WorkoutBlocksApp.Show.Controller options

	App.commands.setHandler "list:blocks", (options) ->
    API.listBlocks options

  App.commands.setHandler "show:block", (options) ->
    API.showBlock options