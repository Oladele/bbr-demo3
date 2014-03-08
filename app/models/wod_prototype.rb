# == Schema Information
#
# Table name: wod_prototypes
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class WodPrototype < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	has_many :groups
end
