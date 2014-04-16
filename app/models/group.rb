# == Schema Information
#
# Table name: groups
#
#  id               :integer          not null, primary key
#  wod_prototype_id :integer
#  wod_id           :integer
#  name             :string(255)
#  position         :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Group < ActiveRecord::Base
	belongs_to :wod
	belongs_to :wod_prototype
	acts_as_list scope: :wod_prototype
	has_many :setts

	# extend Positionable
	# Not used. Need to DELETE
	
	def self.create_from_group(group, to_wod)

		new_group = group.dup
		new_group.wod_id = to_wod.id
		new_group.wod_prototype_id = nil
		new_group.save!

		group.setts.each do |sett|
			new_sett = Sett.create_from_sett(sett, new_group)
		end

		return new_group

	end
end
