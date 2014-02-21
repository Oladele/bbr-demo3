@Demo = do(Backbone, Marionette) ->

	App = new Marionette.Application

	App.rootRoute = Routes.users_path()

	App.on "initialize:before", (options) ->
		@currentUser = App.request "set:current:user", options.currentUser

	App.reqres.setHandler "get:current:user", ->
		App.currentUser

	App.addRegions
		headerRegion: "#header-region"
		mainregion: "#main-region"
		footerRegion: "#footer-region"

	#Second - of invoking Footer_app.Show.Controller.showFooter.See Footer_app
	# App.addInitializer ->
	# 	App.execute "footer:show"

	App.addInitializer ->
		App.module("HeaderApp").start()
		App.module("FooterApp").start()


	App.on "initialize:after", ->
		if Backbone.history
			Backbone.history.start()
			#Backbone.history.navigate "users" if Backbone.history.fragment is ""
			@navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

	App