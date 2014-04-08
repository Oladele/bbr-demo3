@Demo.module "WorkoutSettsApp.List", (List, App, Backbone, Marioette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (options) ->

			block = options.block

			setts = App.request "sett:entities", block

			@layout = @getLayoutView()

			@listenTo @layout, "show", =>
				@listSetts setts

			@show @layout

		getLayoutView: ->
			new List.Layout

		listSetts: (setts) ->
			settsView = @getSettsView setts

			@layout.listModelsRegion.show settsView

			settsView.children.each @handleLayout

		getSettsView: (setts) ->
			new List.Setts
				collection: setts

		handleLayout: (layout) =>
			@listModelRegion layout
			@listSubModelsRegion layout

		listModelRegion: (layout) ->
			listModelView = new List.Sett(model: layout.model)
			layout.listModelRegion.show( listModelView )

		listSubModelsRegion: (layout) ->
			options =
				region: layout.listSubModelsRegion
				sett: layout.model
			App.execute "show:sett", options