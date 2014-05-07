@Demo.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->

  class Entities.Exercise extends Entities.Model

    urlRoot: ->
      Routes.user_exercises_path(App.currentUser.id)

  class Entities.ExercisesCollection extends Entities.Collection
    model: Entities.Exercise

    url: -> 
      Routes.user_exercises_path(App.currentUser.id)

  API =
    getExercises: ->
      exercises = new Entities.ExercisesCollection
      exercises.fetch
        reset: true
      exercises 

  App.reqres.setHandler "exercise:entities", ->
    API.getExercises()