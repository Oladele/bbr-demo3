class WorkoutsController < ApplicationController
	respond_to :json

	def index
		#sleep 3
		@workouts = WodPrototype.all
		@exercises = Exercise.all
		#@users = nil
	end

	def show
		@workout = WodPrototype.find params[:id]
		@exercises = Exercise.all
	end
end
