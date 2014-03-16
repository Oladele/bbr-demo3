collection @workouts

attributes :id, :user_id, :name, :created_at, :updated_at

node do |wod_prototype|
	{
		created_at_formatted: wod_prototype.created_at.strftime("%m/%d/%Y"),
		updated_at_formatted: time_ago_in_words(wod_prototype.updated_at),
		# is_admin:						 	true
	}
end

child :groups do
	attributes :id, :name, :position
	child :setts do
		attributes :id, :position
		child :reps do
			attributes :id, :resistance, :position
			node(:exercise_name)do |rep|
				@exercises.find(rep.exercise_id).name
			end
		end
	end
end