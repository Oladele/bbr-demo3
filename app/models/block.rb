# == Schema Information
#
# Table name: blocks
#
#  id               :integer          not null, primary key
#  wod_prototype_id :integer
#  wod_id           :integer
#  name             :string(255)
#  position         :integer
#  created_at       :datetime
#  updated_at       :datetime
#

class Block < ActiveRecord::Base
	belongs_to :wod
	belongs_to :wod_prototype
	acts_as_list scope: :wod_prototype
	has_many :setts, -> { order("position ASC") }, dependent: :destroy

	# extend Positionable
	# Not used. Need to DELETE
	
	def self.create_from_block(block, to_wod)

		new_block = block.dup
		new_block.wod_prototype_id = to_wod.id
		if to_wod.class == WodPrototype
			new_block.wod_prototype_id = to_wod.id
		elsif to_wod.class == Wod
			new_block.wod_id = to_wod.id
		end
		new_block.save!
		new_block.move_to_bottom

		block.setts.each do |sett|
			new_sett = Sett.create_from_sett(sett, new_block)
		end

		return new_block

	end
end
