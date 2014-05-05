# == Schema Information
#
# Table name: exercises
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Exercise < ActiveRecord::Base
	belongs_to :user
  has_many :reps
	validates :user_id, presence: true
end