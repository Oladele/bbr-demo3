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
	validates_presence_of :name
	has_many :blocks, -> { order ("position ASC") }, dependent: :destroy

  def self.create_from_wod_prototype(wp, to_user)

    new_wp = wp.dup
    new_wp.user_id = to_user.id
    new_wp.save!

    wp.blocks.each do |block|
      new_block = Block.create_from_block(block, new_wp)
    end

    return new_wp
  end

end
