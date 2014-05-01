@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Rep extends Entities.Model

    initialize: (modelParams, options) ->
      @sett_id = modelParams.sett_id

    urlRoot: ->
      Routes.sett_reps_path(@sett_id)

  class Entities.RepsCollection extends Entities.Collection
    model: Entities.Rep

    initialize: (modelsArray, options) ->
      @sett_id = options.sett.get('id')

    url: -> 
      Routes.sett_reps_path(@sett_id)

  API =
    getReps: (sett) ->
      reps = sett.reps

  App.reqres.setHandler "rep:entities", (sett) ->
    API.getReps sett