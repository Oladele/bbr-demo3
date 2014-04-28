class SettsController < ApplicationController
  respond_to :json

  def index
    # sleep 5
    # @setts = sett.all
    group = Group.find(params[:group_id])
    @setts = group.setts
  end

  private

    def sett_params
      params.require(:sett).permit(:group_id, :position)
    end

end