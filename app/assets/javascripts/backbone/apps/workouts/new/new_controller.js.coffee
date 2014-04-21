@Demo.module "WorkoutsApp.New", (New, App, Backbone, Marionette, $, _) ->

	# New.Controller =
	class New.Controller extends App.Controllers.Base

		# newWorkout: ->
		initialize: (options) ->

			workout = App.request "new:workout:entity"
			# workout.on "all", (e) -> console.log e

			# workout.on "created", ->
			@listenTo workout, "created", ->
				App.vent.trigger "workout:created", workout
				
			
			newView = @getNewView workout
			# App.request "form:wrapper", newView
			# @formView = App.request "form:wrapper", newView
			formView = App.request "form:wrapper", newView

			#NEW CODE for new_controller as REAL controller. Below functionality stripped from list_controller
			@listenTo newView, "form:cancel", =>
				@region.close()



			@show formView			

		getNewView: (workout) ->
			new New.Workout
				model: workout