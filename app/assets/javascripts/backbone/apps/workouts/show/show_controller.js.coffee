@Demo.module "WorkoutsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Controller extends App.Controllers.Base

		initialize: (options) ->
			{ workout, id } = options

			workout or= App.request "workout:entity", id
			console.log workout

			# blocks = workout.attributes.groups
			# reps = blocks[0].setts[0].reps
			# compareFunc = getCompareFunc({ field:"pos" })
			# sorted = reps.sort(compareFunc)
			# parcelsOfReps = getParceledReps(reps)
			# parcelSummary0 = getParcelSummary parcelsOfReps[0]

			showView = @getShowView workout
			@show showView

		getShowView: (workout) ->
			new Show.Workout
				model: workout

		getParceledReps = (repsArray, result) ->
			if repsArray.length is 0
				return []
			# if !(repsArray instanceof Array)
			# 	throw new Error 'input must be Array'
		
			# ex = repsArray[0].exercise_name
			# reps = repsArray[0].reps
			# arrLength = repsArray.length
			# arrLastIndex = arrLength-1
			# count = 0
			# while count < arrLength
			# 	if count == arrLastIndex
			# 		count++
			# 		break
			# 	if repsArray[count].resistance == repsArray[count+1].resistance && repsArray[count].exercise_name == repsArray[count+1].exercise_name 
			# 		count++
			# 		else
			# 			count++
			# 			break
			
			# arrSlice = repsArray[0..count-1]
			# arrRemaining = repsArray[count..arrLastIndex]
			# if result is null or result is undefined
			# 	result = []
			# result.push(arrSlice)
			# if arrRemaining.length isnt 0
			# 	getParceledReps(arrRemaining, result)
			# return result

		getParcelSummary = (parcelOfReps)->
			if parcelOfReps.length is 0
				return exercise_name:null, resistance:null, position:null
			if !(parcelOfReps instanceof Array)
				throw new Error 'input must be Arr'
			exercise_name = parcelOfReps[0].exercise_name
			resistance = parcelOfReps[0].resistance
			count = parcelOfReps.length
			summary = exercise_name: exercise_name, resistance: resistance, count: count
			summary