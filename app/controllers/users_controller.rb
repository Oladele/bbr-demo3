class UsersController < ApplicationController
	respond_to :json

	def index
		#sleep 3
		@users = User.all
		#@users = nil
	end
end
