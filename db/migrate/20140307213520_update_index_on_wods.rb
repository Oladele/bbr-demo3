class UpdateIndexOnWods < ActiveRecord::Migration
  def change
  	remove_index :wods, [:user_id, :name]
  	add_index :wods, [:user_id, :name, :time]
  end
end
