@Demo.module "FooterApp.Show",(Show, App, Backbone, Marionetter, $, _) ->

	class Show.Footer extends App.Views.ItemView
		template: "footer/show/show_footer"

		modelEvents:
			"change": "render"