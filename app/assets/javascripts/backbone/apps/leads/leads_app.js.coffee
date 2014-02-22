@Demo.module "LeadsApp", (LeadsApp, App, Backbone, Marionette, $, _) ->

	class LeadsApp.Router extends Marionette.AppRouter
		appRoutes:
			"leads" : "listleads"

		API =
			listleads: ->
				LeadsApp.List.Controller.listLeads()

		App.addInitializer ->
			new LeadsApp.Router
				controller: API
