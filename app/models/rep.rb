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
end
