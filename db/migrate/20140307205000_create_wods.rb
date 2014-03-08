class CreateWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.integer :user_id
      t.string :name
      t.datetime :time

      t.timestamps
    end
    add_index :wods, [:user_id, :name]
  end
end
