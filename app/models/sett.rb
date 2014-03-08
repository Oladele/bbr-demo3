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
	has_many :reps
end
