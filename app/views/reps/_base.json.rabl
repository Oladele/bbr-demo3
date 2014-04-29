attributes :id, :sett_id, :exercise_id, :resistance, :position

node(:exercise_name)do |rep|
  @exercises.find(rep.exercise_id).name
end