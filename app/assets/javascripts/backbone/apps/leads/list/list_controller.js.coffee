@Demo.module "LeadsApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listLeads: ->
			leadsView = @getLeadsView()
			#leadsView = new List.Leads

			App.mainRegion.show leadsView

		getLeadsView: ->
			new List.Leads