class BlocksController < ApplicationController
  respond_to :json

  def index
    # sleep 5
    # @blocks = Block.all
    wp = WodPrototype.find(params[:wod_prototype_id])
    @blocks = wp.blocks
  end

  def show
    # @block = Block.find params[:id]
    wp = WodPrototype.find(params[:wod_prototype_id])
    @block = wp.blocks.find params[:id]
  end

  def update
    # sleep 5
    # @block = Block.find params[:id]
    wp = WodPrototype.find(params[:wod_prototype_id])
    @block = wp.blocks.find params[:id]
    if @block.update_attributes block_params
      render "blocks/show"
    else
      respond_with @block
    end   
  end

  def create
    # sleep 2
    @block = Block.new

    if @block.update_attributes block_params
      render "blocks/show"
    else
      respond_with @block
    end
  end

  def destroy
    # sleep 2
    # block = Block.find params[:id]
    wp = WodPrototype.find(params[:wod_prototype_id])
    @block = wp.blocks.find params[:id]
    @block.destroy()
    render json: {}
  end

  private

    def block_params
      params.require(:block).permit(:name, :wod_prototype_id)
    end
end