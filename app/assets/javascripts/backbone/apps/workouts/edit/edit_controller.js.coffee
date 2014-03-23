@Demo.module "WorkoutsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	# Edit.Controller =
	class Edit.Controller extends App.Controllers.Base

		# edit: (id, workout) ->
		initialize: (options) ->
			# workout = options.workout
			# id = options.id
			#use Coffeescript 'destructuring assignment' below instead of above
			{ workout, id } = options

			workout or= App.request "workout:entity", id
			# workout.on "all", (e) -> console.log e

			# workout.on "updated", =>
			@listenTo workout, "updated", =>
				App.vent.trigger "workout:updated", workout
				@region.close()
				# @layout.triggerMethod "workout:updated", workout

			# editView = @getLayoutView workout
			editView = @getEditView workout
			
			formView = App.request "form:wrapper", editView

			#NEW CODE for new_controller as REAL controller. Below functionality stripped from list_controller
			@listenTo editView, "form:cancel", =>
				# @layout.triggerMethod "form:cancel"
				@region.close()

			# @layout.formRegion.show formView
			@show formView

		getEditView: (workout) ->
			new Edit.Workout
				model: workout