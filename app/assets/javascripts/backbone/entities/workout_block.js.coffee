@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Block extends Entities.Model

	class Entities.BlocksCollection extends Entities.Collection
		model: Entities.Block

	API =
		getBlocks: (workout) ->
			if workout.attributes.groups.length isnt 0
				blocks = workout.attributes.groups
			new Backbone.Collection blocks

	App.reqres.setHandler "block:entities", (workout) ->
		API.getBlocks workout