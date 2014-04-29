class RepsController < ApplicationController
  respond_to :json

  def index
    # sleep 5
    # @reps = Rep.all
    sett = Sett.find(params[:sett_id])
    @reps = sett.reps
    @exercises = Exercise.all
  end

  private

    def rep_params
      params.require(:rep).permit(:sett_id, :position)
    end

end