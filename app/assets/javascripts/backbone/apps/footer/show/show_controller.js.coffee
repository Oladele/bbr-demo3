@Demo.module "FooterApp.Show",(Show, App, Backbone, Marionetter, $, _) ->

	Show.Controller =

			showFooter: ->
				footerView = @getFooterView()
				App.footerRegion.show footerView

			getFooterView: ->
				new Show.Footer