@Demo.module "WorkoutsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	Edit.Controller =

		edit: (id, workout) ->
			workout or= App.request "workout:entity", id

			editView = @getEditView workout

			editView

		getEditView: (workout) ->
			new Edit.Workout
				model: workout