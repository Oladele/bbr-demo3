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
		# sleep 5
		@workout = WodPrototype.find params[:id]
		@exercises = Exercise.all
		if @workout.update_attributes wod_params
			render "workouts/show"
		else
			respond_with @workout
		end		
	end

	def create
		# sleep 2
		@workout = WodPrototype.new
		@exercises = Exercise.all

		###HACK HACK HACK HACK ### forces user_id to be FIRST USER
		if @workout.update_attributes wod_params.merge({user_id:1})
			render "workouts/show"
		else
			respond_with @workout
		end
	end

	def destroy
		# sleep 2
		workout = WodPrototype.find params[:id]
		workout.destroy()
		render json: {}
	end

	private

    def wod_params
      params.require(:workout).permit(:name)
    end
end