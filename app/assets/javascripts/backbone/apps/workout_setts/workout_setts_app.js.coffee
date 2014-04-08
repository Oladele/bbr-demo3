@Demo.module "WorkoutSettsApp", (WorkoutSettsApp, App, Backbone, Marionette, $, _) ->

  API =
    listSetts: (options) ->
      new WorkoutSettsApp.List.Controller options

    showSett: (options) ->
      new WorkoutSettsApp.Show.Controller options

  App.commands.setHandler "list:setts", (options) ->
    API.listSetts options

  App.commands.setHandler "show:sett", (options) ->
    API.showSett options