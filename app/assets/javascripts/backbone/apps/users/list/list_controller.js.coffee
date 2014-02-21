@Demo.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

	List.Controller =

		listUsers: ->
			users = App.request "user:entities"