@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.WodPrototype extends Entities.Model

    initialize: (modelParams, options) ->
      console.log "WodPrototype init modelParams:", modelParams
      @user_id = modelParams.user_id

    urlRoot: ->Routes.user_wod_prototypes_path(@user_id)

    deepCopy: ->
      url = @url() + '/deep_copy'
      options =
        url: url
        type: 'POST'
        success: (server_resp) => 
          console.log 'success callback server_resp:', server_resp

      (@sync || Backbone.sync).call(@, 'deep_copy', @, options)

  class Entities.WodPrototypesCollection extends Entities.Collection
    model: Entities.WodPrototype

    initialize: (modelsArray, options) ->
      @user_id = options.user_id

    url: -> Routes.user_wod_prototypes_path(@user_id)

  API =

    getWodPrototypeEntities: ([], options) ->
      wod_prototypes = new Entities.WodPrototypesCollection([], options)
      wod_prototypes.fetch
        reset: true
      wod_prototypes

    getWodPrototypeEntity: (id) ->
      wod_prototype = new Entities.WodPrototype
        id: id
      wod_prototype.fetch
        reset:true
      wod_prototype

    newWodPrototypeEntity: (modelParams) ->
      new Entities.WodPrototype modelParams

  App.reqres.setHandler "wod_prototype:entities", (user_id) ->
    console.log 'wod_prototype:entities user_id:', user_id
    options =
      user_id: user_id
    API.getWodPrototypeEntities([],options)

  App.reqres.setHandler "wod_prototype:entity", (id) ->
    API.getWodPrototypeEntity id

  App.reqres.setHandler "new:wod_prototype:entity", (user_id) ->
    console.log 'new:prototype:entity user_id:', user_id
    modelParams =
      user_id: user_id
    API.newWodPrototypeEntity(modelParams)