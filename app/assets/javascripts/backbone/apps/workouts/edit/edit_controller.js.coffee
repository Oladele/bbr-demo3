@Demo.module "WorkoutsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	Edit.Controller =

		edit: (id, workout) ->
			workout or= App.request "workout:entity", id
			workout.on "all", (e) -> console.log e

			workout.on "updated", =>
				App.vent.trigger "workout:updated", workout
				@layout.triggerMethod "workout:updated", workout

			@layout = @getLayoutView workout

			# @layout.on "form:cancel", ->
			# 	console.log 'form:cancel from EDIT CONTROLLER layout'

			@layout.on "show", =>
				@formRegion workout

			@layout

		getLayoutView: (workout) ->
			new Edit.Layout
				model:workout

		formRegion: (workout) ->
			editView = @getEditView workout

			editView.on "form:cancel", =>
				@layout.triggerMethod "form:cancel"

			formView = App.request "form:wrapper", editView,
				footer: true

			@layout.formRegion.show formView

		getEditView: (workout) ->
			new Edit.Workout
				model: workout