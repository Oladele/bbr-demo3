@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Rep extends Entities.Model

  class Entities.RepsCollection extends Entities.Collection
    model: Entities.Rep

  API =
    getReps: (sett) ->
      # if sett.attributes.reps.length isnt 0
        # reps = sett.attributes.reps
      reps = sett.reps
      # new Entities.RepsCollection reps

  App.reqres.setHandler "rep:entities", (sett) ->
    API.getReps sett