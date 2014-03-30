@Demo.module "WorkoutBlocksApp", (WorkoutBlocksApp, App, Backbone, Marionette, $, _) ->

	API =
		listBlocks: (workout) ->
			new WorkoutBlocksApp.List.Controller workout

	App.commands.setHandler "list:blocks", (workout) ->
		API.listBlocks workout
