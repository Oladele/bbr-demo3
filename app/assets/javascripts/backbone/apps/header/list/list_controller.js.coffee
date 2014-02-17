@Demo.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listHeader: ->
			links = App.request "header:entities" #@getLinksCollection()
			#console.log links

			headerView = @getHeaderView links
			App.headerRegion.show headerView

		#BELOW IS NOW IMPLEMENTED IN ENTITIES
		# getLinksCollection: ->
		# 	new Backbone.Collection [
		# 		{ name: "Users" }
		# 		{ name: "Leads" }
		# 		{ name: "Appointments" }
		# 	]

		getHeaderView: (links) ->
			new List.Headers
				collection: links

