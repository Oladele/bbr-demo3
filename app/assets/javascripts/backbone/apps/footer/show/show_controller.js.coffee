@Demo.module "FooterApp.Show",(Show, App, Backbone, Marionetter, $, _) ->

	Show.Controller =

			showFooter: ->
				#currentUser = App.currentUser //more decoupled implmementation below
				currentUser = App.request "get:current:user"
				footerView = @getFooterView currentUser
				App.footerRegion.show footerView

			getFooterView: (currentUser) ->
				new Show.Footer
					model: currentUser