@Demo = do(Backbone, Marionette) ->

	App = new Marionette.Application

	App.rootRoute = Routes.users_path()

	App.on "initialize:before", (options) ->
		@currentUser = App.request "set:current:user", options.currentUser

	App.reqres.setHandler "get:current:user", ->
		App.currentUser

	App.addRegions
		headerRegion: "#header-region"
		mainRegion: "#main-region"
		footerRegion: "#footer-region"

	App.addInitializer ->
		App.module("HeaderApp").start()
		App.module("FooterApp").start()

	App.reqres.setHandler "default:region", ->
		App.mainRegion

	App.on "initialize:after", ->
		@startHistory()
		@navigate(@rootRoute, trigger: true) unless @getCurrentRoute()

		# if Backbone.history
		# 	Backbone.history.start()
		# 	#Backbone.history.navigate "users" if Backbone.history.fragment is ""
		# 	@navigate(@rootRoute, trigger: true) if @getCurrentRoute() is ""

	App