class WorkoutsController < ApplicationController
	respond_to :json

	def index
		#sleep 3
		@workouts = WodPrototype.all
		#@users = nil
	end
end
