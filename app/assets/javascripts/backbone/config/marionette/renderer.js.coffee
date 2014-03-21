do (Marionette) ->
	_.extend Marionette.Renderer,

		# root: "backbone/apps/"
		lookups: ["backbone/apps/", "backbone/apps/components/"]


		render: (template, data) ->
			path = @getTemplate(template)
			throw "Template #{template} not found!" unless path
			path(data)

		getTemplate: (template) ->
			for path in [template, template.split("/").insertAt(-1, "templates").join("/")]
				for lookup in @lookups
					return JST[lookup + path] if JST[lookup + path]


# Backbone.Marionette.Renderer.render = (template, data) ->
# 	path = JST["backbone/apps/" + template]
# 	unless path
# 		throw "Template #{template} not found!"
# 	path(data)