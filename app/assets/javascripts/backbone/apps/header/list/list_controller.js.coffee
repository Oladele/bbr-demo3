@Demo.module "HeaderApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listHeader: ->
			links = @getLinksCollection()

			headerView = @getHeaderView links
			App.headerRegion.show headerView

		getLinksCollection: ->
			new Backbone.Collection [
				{ name: "Users" }
				{ name: "Leads" }
				{ name: "Appointments" }
			]

		getHeaderView: (links) ->
			new List.Headers
				collection: links

