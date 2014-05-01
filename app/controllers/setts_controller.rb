class SettsController < ApplicationController
  respond_to :json

  def index
    # sleep 5
    # @setts = sett.all
    block = Block.find(params[:block_id])
    @setts = block.setts
  end

  def show
    # sleep 5
    # @setts = sett.all
    # block = Block.find(params[:block_id])
    @sett = Sett.find(params[:id])
  end

  def deep_copy
    blockSource = Block.find(params[:block_id])
    settSource = Sett.find(params[:id])
    @sett = Sett.create_from_sett(settSource, blockSource)
  end

  def destroy
    # sleep 2
    sett = Sett.find(params[:id])
    sett.destroy()
    render json: {}
  end

  private

    def sett_params
      params.require(:sett).permit(:block_id, :position)
    end

end