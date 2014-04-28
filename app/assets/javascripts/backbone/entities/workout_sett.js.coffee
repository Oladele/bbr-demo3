@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

	class Entities.Sett extends Entities.Model

	class Entities.SettsCollection extends Entities.Collection
		model: Entities.Sett

	API =
		getSetts: (block) ->
			# if block.attributes.setts.length isnt 0
			# 	setts = block.attributes.setts
			# new Entities.SettsCollection setts
			setts = block.setts

	App.reqres.setHandler "sett:entities", (block) ->
		API.getSetts block