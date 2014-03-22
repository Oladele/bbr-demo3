class WorkoutsController < ApplicationController
	respond_to :json

	def index
		# sleep 5
		@workouts = WodPrototype.all
		@exercises = Exercise.all
		#@users = nil
	end

	def show
		@workout = WodPrototype.find params[:id]
		@exercises = Exercise.all
	end

	def update
		# sleep 2
		@workout = WodPrototype.find params[:id]
		@exercises = Exercise.all
		if @workout.update_attributes wod_params
			render "workouts/show"
		else
			respond_with @workout
		end
		
	end

	private

    def wod_params
      params.require(:workout).permit(:name)
    end
end
