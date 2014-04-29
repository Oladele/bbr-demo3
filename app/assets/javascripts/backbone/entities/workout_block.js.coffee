@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Block extends Entities.Model

		defaults:
			setts: []

		initialize: (modelParams, options) ->
			@wod_prototype_id = modelParams.wod_prototype_id
			@setts = new Entities.SettsCollection(modelParams.setts, {block: @ });

		urlRoot: ->
			Routes.wod_prototype_groups_path(@wod_prototype_id)

	class Entities.BlocksCollection extends Entities.Collection
		model: Entities.Block

		initialize: (modelsArray, options) ->
			@wod_prototype_id = options.workout.get('id')

		url: -> 
			Routes.wod_prototype_groups_path(@wod_prototype_id)

	API =
		getBlocks: (workout) ->
			blocks = workout.attributes.groups
			blocksCollection = new Entities.BlocksCollection blocks,
					workout: workout
			blocksCollection

		getBlockEntity: (params) ->
			block = new Entities.Block
				id: params.id
				wod_prototype_id: params.wod_prototype_id
			block.fetch
				reset:true
			block

		newBlockEntity: (params) ->
			new Entities.Block
				wod_prototype_id: params.wod_prototype_id

	App.reqres.setHandler "block:entities", (workout) ->
		API.getBlocks workout

	#new for implementing block cloning
	App.reqres.setHandler "block:entity", (params) ->
		API.getBlockEntity params

	App.reqres.setHandler "new:block:entity", (params) ->
		API.newBlockEntity(params)