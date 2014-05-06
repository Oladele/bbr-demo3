object @block

extends "blocks/_base"

child :setts do
  attributes :id, :block_id, :position
  child :reps do
    attributes :id, :sett_id, :resistance, :position
    node(:exercise_name)do |rep|
      @exercises.find(rep.exercise_id).name
    end
  end
end