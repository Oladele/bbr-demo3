@Demo.module "WorkoutsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Controller extends App.Controllers.Base

		initialize: (options) ->
			{ workout, id } = options

			workout or= App.request "workout:entity", id

			# @listenTo workout, "updated", =>
			# 	App.vent.trigger "workout:updated", workout
			# 	@region.close()

			showView = @getShowView workout
			
			# formView = App.request "form:wrapper", editView

			# @listenTo editView, "form:cancel", =>
			# 	@region.close()

			@show showView

		getShowView: (workout) ->
			new Show.Workout
				model: workout
