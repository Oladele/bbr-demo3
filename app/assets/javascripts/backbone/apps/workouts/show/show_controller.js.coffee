@Demo.module "WorkoutsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

	class Show.Controller extends App.Controllers.Base

		initialize: (options) ->
			{ workout, id } = options

			workout or= App.request "workout:entity", id

			@layout = @getLayoutView()
			
			blocks_options =
				region: @layout.detailsRegionContents
				workout: workout

			@listenTo @layout, "show", =>
				App.execute "list:blocks", blocks_options
				# new App.WorkoutBlocksApp.List.Controller blocks_options
				# @showDetailsView workout

			@show @layout

			# if workout.attributes.groups.length isnt 0
			# 	blocks = workout.attributes.groups
			# 	if blocks[0].setts.length isnt 0
			# 		reps = blocks[0].setts[0].reps
			# 		compareFunc = getCompareFunc({ field:"pos" })
			# 		sorted = reps.sort(compareFunc)
			# 		parcelsOfReps = getParceledReps(reps)
			# 		parcelSummary0 = getParcelSummary parcelsOfReps[0]
			# 		console.log reps
			# 		console.log sorted
			# 		console.log parcelsOfReps
			# 		console.log parcelSummary0

		getLayoutView: ->
			new Show.Layout

		# showDetailsView: (workout) ->
		# 	detailsView = @getDetailsView workout
		# 	@layout.detailsRegionContents.show detailsView

		# getDetailsView: (workout) ->
		# 	new Show.Workout
		# 		model: workout

		# getParceledReps = (repsArray, result) ->
		# 	if repsArray.length is 0
		# 		return []
		# 	if !(repsArray instanceof Array)
		# 		throw new Error 'input must be Array'
		
		# 	ex = repsArray[0].exercise_name
		# 	reps = repsArray[0].reps
		# 	arrLength = repsArray.length
		# 	arrLastIndex = arrLength-1
		# 	count = 0
		# 	while count < arrLength
		# 		if count == arrLastIndex
		# 			count++
		# 			break
		# 		if repsArray[count].resistance == repsArray[count+1].resistance && repsArray[count].exercise_name == repsArray[count+1].exercise_name 
		# 			count++
		# 		else
		# 			count++
		# 			break
			
		# 	arrSlice = repsArray[0..count-1]
		# 	arrRemaining = repsArray[count..arrLastIndex]
		# 	if result is null or result is undefined
		# 		result = []
		# 	result.push(arrSlice)
		# 	if arrRemaining.length isnt 0
		# 		getParceledReps(arrRemaining, result)
		# 	return result

		# getParcelSummary = (parcelOfReps)->
		# 	if parcelOfReps.length is 0
		# 		return exercise_name:null, resistance:null, position:null
		# 	if !(parcelOfReps instanceof Array)
		# 		throw new Error 'input must be Arr'
		# 	exercise_name = parcelOfReps[0].exercise_name
		# 	resistance = parcelOfReps[0].resistance
		# 	count = parcelOfReps.length
		# 	summary = exercise_name: exercise_name, resistance: resistance, count: count
		# 	summary

		# getCompareFunc = (options)->

		# 	if !(options.field)
		# 		throw new NoKeyError()

		# 	_.defaults options,
		# 		asNumber: true
		# 		dupsAllowed: false

		# 	{ field, asNumber, dupsAllowed } = options


		# 	if asNumber || dupsAllowed
		# 		return compareAsNum

		# 	if asNumber || !dupsAllowed
		# 		return compareAsNumNoDups

		# 	if !asNumber || dupsAllowed
		# 		return compareAsText

		# 	if !asNumber || !dupsAllowed
		# 		return compareAsTextNoDups

		# 	compareAsNum = (a, b) ->
		# 	if !(_.has a, field) or !(_.has b, field)
		# 		throw new NoKeyError()
		# 	if Number(a[field]) < Number(b[field])
		# 		return -1
		# 	if Number(a[field]) > Number(b[field])
		# 		return 1
		# 	return 0

		# 	compareAsNumNoDups = (a, b) ->
		# 	if !(_.has a, field) or !(_.has b, field)
		# 		throw new NoKeyError()
		# 	if Number(a[field]) < Number(b[field])
		# 		return -1
		# 	if Number(a[field]) > Number(b[field])
		# 		return 1
		# 	throw new DupValuesError

		# 	compareAsText = (a, b) ->
		# 	if !(_.has a, field) or !(_.has b, field)
		# 		throw new NoKeyError()
		# 	if String(a[field]) < String(b[field])
		# 		return -1
		# 	if String(a[field]) > String(b[field])
		# 		return 1
		# 	return 0

		# 	compareAsTextNoDups = (a, b) ->
		# 	if !(_.has a, field) or !(_.has b, field)
		# 		throw new NoKeyError()
		# 	if String(a[field]) < String(b[field])
		# 		return -1
		# 	if String(a[field]) > String(b[field])
		# 		return 1
		# 	throw new DupValuesError