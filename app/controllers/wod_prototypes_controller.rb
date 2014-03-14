class WodPrototypesController < ApplicationController
	respond_to :json

	def index
		#sleep 3
		@wod_prototypes = WodPrototype.all
		#@users = nil
	end
end
