@Demo.module "WorkoutSettsApp.List", (List, App, Backbone, Marioette, $, _) ->

	class List.Controller extends App.Controllers.Base

		initialize: (options) ->

			block = options.setts

			sett = App.request "sett:entities", block

			@layout = @getLayoutView()

			@listenTo @layout, "show", =>
				@showSetts setts

			@show @layout

		getLayoutView: ->
			new List.Layout

		showSetts: (setts) ->
			settsView = @getSettsView setts

		getSettsView: (setts) ->
			new List.Setts
				collection: setts