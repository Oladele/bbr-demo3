@Demo.module "WorkoutSettsApp.List", (List, App, Backbone, Marioette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (options) ->

			block = options.block

			setts = App.request "sett:entities", block

			# @layout = @getLayoutView()
			settsView = @getSettsView setts

			# @listenTo @layout, "show", =>
			# 	@listSetts setts

			# @show @layout
			@show settsView
			settsView.children.each @handleChildLayout

		# getLayoutView: ->
		# 	new List.Layout

		# listSetts: (setts) ->
		# 	settsView = @getSettsView setts

		# 	@layout.listModelsRegion.show settsView

		# 	settsView.children.each @handleChildLayout

		getSettsView: (setts) ->
			new List.Setts
				collection: setts

		handleChildLayout: (layout) =>
			subModel_options =
				region: layout.listSubModelsRegion
				sett: layout.model
			@listModelRegion layout, subModel_options
			@listSubModelsRegion subModel_options

		listModelRegion: (layout, subModel_options) ->
			listModelView = new List.Sett(model: layout.model)
			@listenTo listModelView, "expand:sett:button:clicked", (e) ->
				@toggleSubModelsRegion subModel_options
			layout.listModelRegion.show( listModelView )

		listSubModelsRegion: (subModel_options) ->
			App.execute "show:sett", subModel_options

		toggleSubModelsRegion: (subModel_options) ->
			if subModel_options.region.currentView
				subModel_options.region.reset()
			else
				App.execute "show:sett", subModel_options