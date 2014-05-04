class WodPrototypesController < ApplicationController
	respond_to :json

	def index
		#sleep 3
    user = User.find(params[:user_id])
		@wod_prototypes = user.wod_prototypes.order(created_at: :asc)

		#@users = nil
	end

  def show
    user = User.find(params[:user_id])
    @wod_prototype = user.wod_prototypes.find params[:id]
  end

  def deep_copy
    userSource = User.find(params[:user_id])
    wodSource = WodPrototype.find(params[:id])
    @wod = WodPrototype.create_from_wod_prototype(wodSource, userSource)
    # @wod = WodPrototype.create_from_wod_prototype(wodSource, wodSource.user)
  end

  def update
    # sleep 5
    user = User.find(params[:user_id])
    @wod_prototype = user.wod_prototypes.find params[:id]
    # @wod_prototype = WodPrototype.find params[:id]
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
