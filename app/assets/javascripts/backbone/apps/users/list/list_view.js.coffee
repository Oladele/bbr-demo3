@Demo.module "UsersApp.List", (List, App, Backbone, Marionette, $, _) ->

	class List.Layout extends App.Views.Layout
		template: "users/list/templates/list_layout"

		regions:
			panelRegion: "#panel-region"
			usersRegion: "#users-region"

	class List.Panel extends App.Views.ItemView
		template: "users/list/templates/_panel"

		collectionEvents:
			"sync" : "render"

	class List.User extends App.Views.ItemView
		template: "users/list/templates/_user"
		tagName: "tr"

	class List.Users extends App.Views.CompositeView
		template: "users/list/templates/_users"
		itemView: List.User
		itemViewContainer: "tbody"