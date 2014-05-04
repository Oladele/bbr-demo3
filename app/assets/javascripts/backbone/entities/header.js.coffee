@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Header extends Entities.Model

	class Entities.HeaderCollection extends Entities.Collection
		model: Entities.Header

	API =
		getHeaders: ->
			new Backbone.Collection [
				{ name: "Users", url: Routes.users_path() }
				{ name: "Workouts", url: Routes.user_workouts_path(App.currentUser.id) }
				{ name: "Settings", url: Routes.leads_path() }
				# { name: "Appointments", url: "appointments" } 
				#used string for appointments since we don't have time to set up route paths
				#remember that js_routes gem creates JS Routes based on RoR routes.rb
			]

	App.reqres.setHandler "header:entities", ->
		API.getHeaders()