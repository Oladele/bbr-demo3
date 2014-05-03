@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.WodPrototype extends Entities.Model
    urlRoot: ->Routes.wod_prototypes_path()

  class Entities.WodPrototypesCollection extends Entities.Collection
    model: Entities.WodPrototype
    url: -> Routes.wod_prototypes_path()

  API =

    getWodPrototypeEntities: ->
      wod_prototypes = new Entities.WodPrototypesCollection
      wod_prototypes.fetch
        reset: true
      wod_prototypes

    getWodPrototypeEntity: (id) ->
      wod_prototype = new Entities.WodPrototype
        id: id
      wod_prototype.fetch
        reset:true
      wod_prototype

    newWodPrototypeEntity: ->
      new Entities.WodPrototype

  App.reqres.setHandler "wod_prototype:entities", ->
    API.getWodPrototypeEntities()

  App.reqres.setHandler "wod_prototype:entity", (id) ->
    API.getWodPrototypeEntity id

  App.reqres.setHandler "new:wod_prototype:entity", ->
    API.newWodPrototypeEntity()