# == Schema Information
#
# Table name: wods
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  wod_prototype_id :integer
#  name             :string(255)
#  time             :datetime
#

class Wod < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	include UsersHelper
	include SessionsHelper

	def Wod.create_from(wod_proto) #can be created from wod_prototype
		# user_id = wod_proto.user_id 
		user_id = current_user.id
		wod_prototype_id = wod_proto.id
		name = wod_proto.name
		time = Time.now

		wod = Wod.create!(user_id: user_id, wod_prototype_id: wod_prototype_id, name: name, time: time)
		return wod

	end
end
