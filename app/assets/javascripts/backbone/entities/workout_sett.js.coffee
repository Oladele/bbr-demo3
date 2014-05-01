@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Sett extends Entities.Model

		# defaults:
		# 	reps: []

		initialize: (modelParams, options) ->
			@group_id = modelParams.group_id
			console.log 'sett init, @group_id:', @group_id
			
			if modelParams.reps
				console.log '+init @reps RepsCollection, sett:', @
				@reps = new Entities.RepsCollection(modelParams.reps, {sett: @ })
				console.log '+init @reps RepsCollection, @reps.url:', @reps.url()
			else
				console.log '-init @reps RepsCollection, sett:', @
				@reps = new Entities.RepsCollection([], {sett: @ })
				console.log '-init @reps RepsCollection, @reps.url:', @reps.url()
				@reps.fetch()

		urlRoot: ->
			Routes.group_setts_path(@group_id)

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
			console.log 'settsColl init, @block_id:', @block_id

		url: ->
			console.log 'settsColl url, @block_id:', @block_id
			Routes.group_setts_path(@block_id)

	API =
		getSetts: (block) ->
			setts = block.setts

	App.reqres.setHandler "sett:entities", (block) ->
		API.getSetts block