class CreateTableWods < ActiveRecord::Migration
  def change
    create_table :wods do |t|
      t.integer :user_id
      t.integer :wod_prototype_id
      t.string :name
      t.datetime :time
    end
    add_index :wods, [:user_id, :wod_prototype_id, :name, :time ], unique: true, name: 'wod_index'
  end
end
