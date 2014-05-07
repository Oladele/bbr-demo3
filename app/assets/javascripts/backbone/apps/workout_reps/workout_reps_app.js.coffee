@Demo.module "WorkoutRepsApp", (WorkoutRepsApp, App, Backbone, Marionette, $, _) ->

  API =
    listReps: (options) ->
      new WorkoutRepsApp.List.Controller options

    editRep: (options) ->
      new WorkoutRepsApp.Edit.Controller options

  App.commands.setHandler "list:reps", (options) ->
    API.listReps options

  App.commands.setHandler "edit:rep", (options) ->
    API.editRep options

  # App.vent.on "rep:updated", (options) ->
  #   App.navigate Routes.workout_path(options.workout.id)
  #   API.showWorkoutTopModel options