@Demo = do(Backbone, Marionette) ->

	App = new Marionette.Application

	App.addRegions
		headerRegion: "#header-region"
		mainregion: "#main-region"
		footerRegion: "#footer-region"

	#Second - of invoking Footer_app.Show.Controller.showFooter.See Footer_app
	# App.addInitializer ->
	# 	App.execute "footer:show"

	App.addInitializer ->
		App.module("FooterApp").start()


	App.on "initialize:after", ->
		if Backbone.history
			Backbone.history.start()

	App