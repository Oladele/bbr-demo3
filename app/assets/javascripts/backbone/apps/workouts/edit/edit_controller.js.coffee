@Demo.module "WorkoutsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

	# Edit.Controller =
	class Edit.Controller extends App.Controllers.Base

		# edit: (id, workout) ->
		initialize: (options) ->
			# workout = options.workout
			# id = options.id
			#use Coffeescript 'destructuring assignment' below instead of above
			{ workout, id, region } = options

			@options = options

			workout or= App.request "workout:entity", id
			# workout.on "all", (e) -> console.log e
			@options.workout = workout

			# workout.on "updated", =>
			@listenTo workout, "updated", =>
				@region.close()
				App.vent.trigger "workout:updated", @options
				# @layout.triggerMethod "workout:updated", workout

			# editView = @getLayoutView workout
			editView = @getEditView workout
			
			formView = App.request "form:wrapper", editView

			#NEW CODE for new_controller as REAL controller. Below functionality stripped from list_controller
			@listenTo editView, "form:cancel", =>
				# editView.triggerMethod "edit:form:cancel"
				# console.log @region
				@region.close()
				App.vent.trigger "workout:cancelled", @options

			# @layout.formRegion.show formView
			@show formView

		getEditView: (workout) ->
			new Edit.Workout
				model: workout