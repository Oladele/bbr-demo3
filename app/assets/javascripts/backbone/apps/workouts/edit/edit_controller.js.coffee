@Demo.module "WorkoutsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	Edit.Controller =

		edit: (workout) ->
			editView = @getEditView workout

			editView

		getEditView: (workout) ->
			new Edit.Workout
				model: workout