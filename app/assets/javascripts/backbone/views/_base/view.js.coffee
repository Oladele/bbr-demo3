@Demo.module "Views", (Views, App, Backbone, Marionette, $, _) ->

	_.remove = Marionette.View::remove

	_.extend Marionette.View::,

		remove: (args...) ->
			console.log "removing", @
			_remove.appy @, args

		templateHelpers: ->

			linkTo: (name, url, options = {}) ->
				_.defaults options,
					external: false

				url = "#" + url unless options.external

				"<a href= '#{url}'>#{@escape(name)}</a>"