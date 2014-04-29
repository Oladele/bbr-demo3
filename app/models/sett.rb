# == Schema Information
#
# Table name: setts
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  position   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Sett < ActiveRecord::Base
	belongs_to :group
	validates :group_id, presence: true
	acts_as_list scope: :group
	has_many :reps

	def self.create_from_sett(sett, to_group)

		new_sett = sett.dup
		new_sett.group_id = to_group.id
		new_sett.save!

		sett.reps.each do |rep|
			new_rep = Rep.create_from_rep(rep, new_sett)
		end

		return new_sett
	end
end
