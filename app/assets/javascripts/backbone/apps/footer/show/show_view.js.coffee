@Demo.module "FooterApp.Show",(Show, App, Backbone, Marionetter, $, _) ->

	class Show.Footer extends Marionette.ItemView
		template: "footer/show/templates/show_footer"