@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Block extends Entities.Model

	class Entities.BlocksCollection extends Entities.Collection
		model: Entities.Block

	API =
		getBlocks: (workout) ->
			console.log 'workout', workout
			console.log 'workout.attributes', workout.attributes
			console.log 'workout.attributes.id', workout.attributes.id
			console.log 'workout.attributes.groups', workout.attributes.groups
			if workout.attributes.groups.length isnt 0
			  blocks = workout.attributes.groups
			console.log 'getBlocks', blocks
			new Entities.BlocksCollection blocks

	App.reqres.setHandler "block:entities", (workout) ->
		console.log workout
		API.getBlocks workout