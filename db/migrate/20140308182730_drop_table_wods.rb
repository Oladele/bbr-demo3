class DropTableWods < ActiveRecord::Migration
  def change
  	drop_table :wods
  end
end
