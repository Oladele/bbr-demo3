@Demo.module "WorkoutSettsApp.List", (List, App, Backbone, Marioette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (options) ->

			block = options.block

			setts = App.request "sett:entities", block

			# @layout = @getLayoutView()
			@settsView = @getSettsView setts

			# @listenTo @layout, "show", =>
			# 	@listSetts setts

			# @show @layout
			@show @settsView
			console.log 'settsView:', @settsView
			@settsView.children.each @handleChildLayout

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
			layout.collection = @settsView.collection
			console.log 'settsView.child:', layout
			console.log '@settsView within child handler', @settsView
			
			subModel_options =
				region: layout.listSubModelsRegion
				sett: layout.model
				collection: @settsView.collection
			
			@listModelRegion layout, subModel_options
			@listSubModelsRegion subModel_options

		listModelRegion: (layout, subModel_options) ->
			listModelView = new List.Sett
				model: layout.model
				collection: subModel_options.collection
			
			@listenTo listModelView, "expand:sett:button:clicked", (e) ->
				@toggleSubModelsRegion subModel_options

			@listenTo listModelView, "sett:delete", (e) ->
				# console.log 'sett:delete clicked', e
				model = e.model
				if confirm "Are you sure you want to delete set: #{model.get("position")}?" then model.destroy() else false
			
			@listenTo listModelView, "sett:copy", (e) ->
				console.log 'sett:copy clicked', e
				e.model.deepCopy()

			layout.listModelRegion.show( listModelView )

		listSubModelsRegion: (subModel_options) ->
			App.execute "show:sett", subModel_options

		toggleSubModelsRegion: (subModel_options) ->
			if subModel_options.region.currentView
				subModel_options.region.reset()
			else
				App.execute "show:sett", subModel_options