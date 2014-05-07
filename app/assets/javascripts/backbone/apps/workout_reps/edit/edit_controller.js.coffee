@Demo.module "WorkoutRepsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->
      { rep,region } = options

      @options = options

      # workout or= App.request "workout:entity", id

      # @options.workout = workout

      @listenTo rep, "updated", =>
        @region.close()
        App.vent.trigger "rep:updated", @options

      editView = @getEditView rep

      console.log 'edit rep editView:', editView
      
      formView = App.request "form:wrapper", editView

      @listenTo editView, "form:cancel", =>
        @region.close()
        App.vent.trigger "rep:cancelled", @options

      @show formView

    getEditView: (rep) ->
      new Edit.Rep
        model: rep
        collection: rep.collection