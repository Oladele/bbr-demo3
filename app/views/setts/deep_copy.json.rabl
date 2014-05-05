object @sett

extends "setts/_base"

child :reps do
  attributes :id, :sett_id, :resistance, :position
  node(:exercise_name)do |rep|
    @exercises.find(rep.exercise_id).name
  end
end