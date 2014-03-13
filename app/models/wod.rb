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
	has_many :groups
	before_create :update_position
	extend Positionable
	

	def self.create_from_wod_prototype(user, wod_proto)
		user_id = user.id
		wod_prototype_id = wod_proto.id
		name = wod_proto.name
		time = Time.now

		new_wod = self.create!(user_id: user_id, wod_prototype_id: wod_prototype_id, name: name, time: time)

		wod_proto.groups.each do |group|
			position = next_position(new_wod.groups)
			new_group = group.dup
			new_group.wod_prototype_id = nil
			new_group.wod_id = new_wod.id
			new_group.position = position
			new_group.save!
		end

		return new_wod

	end


	private
		def update_position
			# self.position = self.user_id
		end

		
end
