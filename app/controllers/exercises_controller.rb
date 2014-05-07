class ExercisesController < ApplicationController
  respond_to :json

  def index
    # sleep 5
    user = User.find(params[:user_id])
    @exercises = user.exercises
  end

end