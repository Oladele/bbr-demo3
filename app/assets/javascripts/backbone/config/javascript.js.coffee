DupValuesError = new Error "Some objects have same value for field being compared"
NoKeyError = new Error "Object missing key/field being compared"

Array::insertAt = (index, item) ->
	@splice(index, 0, item)
	@

# "compare" function for Array.sort() for sorting arrays of 'positionable' objects 
# Sorts the array by the 'position' field in each object
# Requires 'a' and 'b' below to be objects with integer fields/keys named position.
# options = { field: "fieldname", asNumber: boolean, dupsAllowed: boolean }
getCompareFunc = (options)->

	if !(options.field)
		throw new NoKeyError()

	_.defaults options,
		asNumber: true
		dupsAllowed: false

	{ field, asNumber, dupsAllowed } = options


	if asNumber || dupsAllowed
		return compareAsNum

	if asNumber || !dupsAllowed
		return compareAsNumNoDups

	if !asNumber || dupsAllowed
		return compareAsText

	if !asNumber || !dupsAllowed
		return compareAsTextNoDups

	compareAsNum = (a, b) ->
	if !(_.has a, field) or !(_.has b, field)
		throw new NoKeyError()
	if Number(a[field]) < Number(b[field])
		return -1
	if Number(a[field]) > Number(b[field])
		return 1
	return 0

	compareAsNumNoDups = (a, b) ->
	if !(_.has a, field) or !(_.has b, field)
		throw new NoKeyError()
	if Number(a[field]) < Number(b[field])
		return -1
	if Number(a[field]) > Number(b[field])
		return 1
	throw new DupValuesError

	compareAsText = (a, b) ->
	if !(_.has a, field) or !(_.has b, field)
		throw new NoKeyError()
	if String(a[field]) < String(b[field])
		return -1
	if String(a[field]) > String(b[field])
		return 1
	return 0

	compareAsTextNoDups = (a, b) ->
	if !(_.has a, field) or !(_.has b, field)
		throw new NoKeyError()
	if String(a[field]) < String(b[field])
		return -1
	if String(a[field]) > String(b[field])
		return 1
	throw new DupValuesError