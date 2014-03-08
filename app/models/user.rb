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
	has_many :wods
	has_many :exercises

	def full_name
		"#{first_name} #{last_name}"
	end
	
end
