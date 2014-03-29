getComparatorFunc = (options)->
	_.defaults options,
		asNumber: true
		dupsAllowed: false

	{ field, asNumber, dupsAllowed } = options
		
	compareAsText = (a, b) ->
        if String(a[field]) < String(b.pos)
            return -1
        if String(a.pos) > String(b.pos)
            return 1
        return 0
    
    compareAsText

com = (a, b) ->
    if String(a.pos) < String(b.pos)
        return -1
    if String(a.pos) > String(b.pos)
        return 1
    return 0

reps = [{pos:3},{pos:1},{pos:2}]
console.log _.pluck(reps, "pos")

comparator = getComparatorFunc({field: "posill", asNumber:false, dupsAllowed:true})
console.log comparator
console.log com
console.log comparator({pos:0},{pos:1})
console.log com({pos:0},{pos:1})
#reps.sort(comparator)
console.log _.pluck(reps.sort(comparator), "pos")