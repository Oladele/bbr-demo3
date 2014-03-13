module Positionable

	def next_position(model_collection )
		if model_collection.empty?
			1
		else
			max_position = model_collection.maximum :position
		  max_position += 1
		end
	end

end