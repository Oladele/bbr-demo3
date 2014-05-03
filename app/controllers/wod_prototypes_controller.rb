class WodPrototypesController < ApplicationController
	respond_to :json

	def index
		#sleep 3
		@wod_prototypes = WodPrototype.all
		#@users = nil
	end

  def show
    @wod_prototype = WodPrototype.find params[:id]
  end

  def update
    # sleep 5
    @wod_prototype = WodPrototype.find params[:id]
    if @wod_prototype.update_attributes wod_params
      render "wod_prototypes/show"
    else
      respond_with @wod_prototype
    end   
  end

  def create
    # sleep 2
    @wod_prototype = WodPrototype.new

    #TODO: HACK - forces user_id to be FIRST USER
    if @wod_prototype.update_attributes wod_params.merge({user_id:1})
      render "wod_prototypes/show"
    else
      respond_with @wod_prototype
    end
  end

  def destroy
    # sleep 2
    wod_prototype = WodPrototype.find params[:id]
    wod_prototype.destroy()
    render json: {}
  end

  private

    def wod_params
      params.require(:wod_prototype).permit(:name)
    end
end
