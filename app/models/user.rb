# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
	has_many :wod_prototypes
	has_many :exercises
  has_many :wods, -> { order ("created_at ASC") }, dependent: :destroy

	def full_name
		"#{first_name} #{last_name}"
	end
	
end
