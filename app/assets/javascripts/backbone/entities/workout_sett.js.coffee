@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Sett extends Entities.Model

		# defaults:
		# 	reps: []

		initialize: (modelParams, options) ->
			@block_id = modelParams.block_id
			
			if modelParams.reps
				@reps = new Entities.RepsCollection(modelParams.reps, {sett: @ })
			else
				@reps = new Entities.RepsCollection([], {sett: @ })
				@reps.fetch()

		urlRoot: ->
			Routes.block_setts_path(@block_id)

		deepCopy: ->
			url = @url() + '/deep_copy'
			options =
				url: url
				type: 'POST'
				success: (server_resp) => 
					console.log 'success callback server_resp:', server_resp

			(@sync || Backbone.sync).call(@, 'deep_copy', @, options)

	class Entities.SettsCollection extends Entities.Collection
		model: Entities.Sett

		initialize: (modelsArray, options) ->
			@block_id = options.block.get('id')

		url: ->
			Routes.block_setts_path(@block_id)

	API =
		getSetts: (block) ->
			setts = block.setts

	App.reqres.setHandler "sett:entities", (block) ->
		API.getSetts block