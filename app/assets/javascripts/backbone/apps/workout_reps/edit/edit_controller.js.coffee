@Demo.module "WorkoutRepsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (options) ->

      @options = options
      { rep,region } = @options

      exercises = App.request "exercise:entities"
      console.log 'exercises', exercises

      App.execute "when:fetched", exercises, =>


        @listenTo rep, "updated", =>
          @region.close()
          App.vent.trigger "rep:updated", @options

        editView = @getEditView rep, exercises
        # TODO: Remove:
        window.temp_EditView = editView

        @listenTo editView, "show", ->
          ex_id = editView.$el.find('#ex_id')
          ex_name = editView.$el.find('#ex_name')
          exercises.each (exercise) ->
            opt = $("<option/>",{html: exercise.get("name"), value: exercise.get("id")})
            ex_id.append(opt)
          ex_id.val rep.get("exercise_id")
          ex_id.change (eventObject)->
            exercise_id = ex_id.val()
            paramString = "[value=" + exercise_id + "]"
            selected_text = ex_id.find(paramString).text()
            ex_name.val(selected_text)
            console.log 'exercise_id:', exercise_id
            console.log 'paramString:', paramString
            console.log 'selected_text:', selected_text
        
        formView = App.request "form:wrapper", editView

        # @listenTo formView, "show", =>
        #   console.log 'hello from edit controller', formView

        @listenTo editView, "form:cancel", =>
          @region.close()
          App.vent.trigger "rep:cancelled", @options

        @show formView

    getEditView: (rep, exercises) ->
      new Edit.Rep
        model: rep
        collection: rep.collection
        exercises: exercises