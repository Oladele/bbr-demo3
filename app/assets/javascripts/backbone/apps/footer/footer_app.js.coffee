@Demo.module "FooterApp", (FooterApp, App, Backbone, Marionette, $, _) ->
	@startWithParent = false #see 'Third'

	API =
		showFooter: ->
			FooterApp.Show.Controller.showFooter()

	# 3 different ways for app to actually invoke API.showFooter()

	#First - add initializer to App
	# App.addInitializer ->
	# 	API.showFooter()

	#Second - use messaging bus
	#update app.js module to add initializer
	#within that initializer execute command "footer:show" which is handled here
	# App.commands.setHandler "footer:show", ->
	# 	API.showFooter()

	#Third - use built-in 'start' even
	#note that @startWithParent = false has been added
	#instead FooterApp.start() is called in initializer of app.js
	FooterApp.on "start", ->
		API.showFooter()