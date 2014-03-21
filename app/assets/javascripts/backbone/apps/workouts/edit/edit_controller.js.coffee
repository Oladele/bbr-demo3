@Demo.module "WorkoutsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	Edit.Controller =

		edit: (id, workout) ->
			workout or= App.request "workout:entity", id

			@layout = @getLayoutView workout
			# editView = @getEditView workout

			@layout.on "show", =>
				@formRegion workout

			@layout

		getLayoutView: (workout) ->
			new Edit.Layout
				model:workout

		formRegion: (workout) ->
			editView = @getEditView workout

			formView = App.request "form:wrapper", editView

			@layout.formRegion.show formView

		getEditView: (workout) ->
			new Edit.Workout
				model: workout