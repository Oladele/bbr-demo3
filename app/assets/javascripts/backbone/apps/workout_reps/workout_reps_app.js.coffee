@Demo.module "WorkoutRepsApp", (WorkoutRepsApp, App, Backbone, Marionette, $, _) ->

  API =
    listReps: (options) ->
      new WorkoutRepsApp.List.Controller options

  App.commands.setHandler "list:reps", (options) ->
    API.listReps options