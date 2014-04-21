@Demo.module "WorkoutsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	class Edit.Controller extends App.Controllers.Base

		initialize: (options) ->
			{ workout, id, region } = options

			@options = options

			workout or= App.request "workout:entity", id

			@options.workout = workout

			@listenTo workout, "updated", =>
				@region.close()
				App.vent.trigger "workout:updated", @options

			editView = @getEditView workout
			
			formView = App.request "form:wrapper", editView

			@listenTo editView, "form:cancel", =>
				@region.close()
				App.vent.trigger "workout:cancelled", @options

			@show formView

		getEditView: (workout) ->
			new Edit.Workout
				model: workout