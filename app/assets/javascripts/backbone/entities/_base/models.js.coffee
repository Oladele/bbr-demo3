@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Model extends Backbone.Model

		save: (data, options = {}) ->
			isNew = @isNew()

			_.defaults options,
				wait: true
				success: _.bind(@saveSuccess, @, isNew, options.collection)

			super data, options

		saveSuccess: (isNew, collection) =>
			if isNew ##model is being created
				collection.add @ if collection
				collection.trigger "model:created", @ if collection
				@trigger "created", @
			else ## model is being updated
				collection ?= @collection ## if model has collection property defined, use that if no collection option exists
				collection.trigger "model:updated", @ if collection
				@trigger "updated", @