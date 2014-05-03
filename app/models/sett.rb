# == Schema Information
#
# Table name: setts
#
#  id         :integer          not null, primary key
#  block_id   :integer
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Sett < ActiveRecord::Base
	belongs_to :block
	validates :block_id, presence: true
	acts_as_list scope: :block
	has_many :reps, -> { order("position ASC") }, dependent: :destroy

	def self.create_from_sett(sett, to_block)

		new_sett = sett.dup
		new_sett.block_id = to_block.id
		new_sett.save!
		new_sett.move_to_bottom

		sett.reps.each do |rep|
			new_rep = Rep.create_from_rep(rep, new_sett)
		end

		return new_sett
	end
end
