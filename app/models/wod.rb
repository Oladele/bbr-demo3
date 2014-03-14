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
	extend Positionable
	#originaly used for 'create_from'. 
	#No longer used by may be useful for future CRUD

	def self.create_from_wod_prototype(user, wod_proto)
		user_id = user.id
		wod_prototype_id = wod_proto.id
		name = wod_proto.name
		time = Time.now

		new_wod = self.create!(user_id: user_id, wod_prototype_id: wod_prototype_id, name: name, time: time)

		wod_proto.groups.each do |group|
			new_group = Group.create_from_group(group, new_wod)
		end
		return new_wod
	end
		
end
