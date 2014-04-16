@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Block extends Entities.Model
		urlRoot: ->Routes.groups_path()

	class Entities.BlocksCollection extends Entities.Collection
		model: Entities.Block
		url: -> Routes.groups_path()

	API =
		getBlocks: (workout) ->
			if workout.attributes.groups.length isnt 0
			  blocks = workout.attributes.groups
			new Entities.BlocksCollection blocks

		getBlockEntity: (id) ->
			block = new Entities.Block
				id: id
			block.fetch
				reset:true
			block

		newBlockEntity: ->
			new Entities.Block

	App.reqres.setHandler "block:entities", (workout) ->
		API.getBlocks workout

	App.reqres.setHandler "block:entity", (id) ->
		API.getBlockEntity id

	App.reqres.setHandler "new:block:entity", ->
		API.newBlockEntity()