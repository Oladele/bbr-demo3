collection @workouts

attributes :id, :user_id, :name, :created_at, :updated_at

node do |wod_prototype|
	{
		created_at_formatted: wod_prototype.created_at.strftime("%m/%d/%Y"),
		updated_at_formatted: time_ago_in_words(wod_prototype.updated_at),
		# is_admin:						 	true
	}
end