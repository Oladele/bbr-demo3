class RepsController < ApplicationController
  respond_to :json

  def index
    # sleep 5
    # @reps = Rep.all
    sett = Sett.find(params[:sett_id])
    @reps = sett.reps
    @exercises = Exercise.all
  end

  def show
    sett = Sett.find(params[:sett_id])
    @rep = sett.reps.find params[:id]
  end

  def update
    # sleep 5
    sett = Sett.find(params[:sett_id])
    @rep = sett.reps.find params[:id]
    if @rep.update_attributes rep_params
      render "reps/show"
    else
      respond_with @rep
    end   
  end

  private

    def rep_params
      params.require(:rep).permit(:sett_id, :position, :resistance, :exercise_id)
    end

end