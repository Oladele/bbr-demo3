@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Sett extends Entities.Model

		defaults:
			reps: []

		initialize: (modelParams, options) ->
			@group_id = modelParams.group_id
			@reps = new Entities.RepsCollection(modelParams.reps, {sett: @ });

		urlRoot: ->
			Routes.group_setts_path(@group_id)

	class Entities.SettsCollection extends Entities.Collection
		model: Entities.Sett

		initialize: (modelsArray, options) ->
			@block_id = options.block.get('id')

		url: -> 
			Routes.group_setts_path(@block_id)

	API =
		getSetts: (block) ->
			# if block.attributes.setts.length isnt 0
			# 	setts = block.attributes.setts
			# new Entities.SettsCollection setts
			setts = block.setts

	App.reqres.setHandler "sett:entities", (block) ->
		API.getSetts block