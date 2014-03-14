# == Schema Information
#
# Table name: reps
#
#  id          :integer          not null, primary key
#  sett_id     :integer
#  exercise_id :integer
#  resistance  :decimal(, )
#  position    :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Rep < ActiveRecord::Base
	belongs_to :sett
	validates :sett_id, presence: true

	def self.create_from_rep(rep, to_sett)
		new_rep = rep.dup
		new_rep.sett_id = to_sett.id
		new_rep.save!
		return new_rep
	end
end
