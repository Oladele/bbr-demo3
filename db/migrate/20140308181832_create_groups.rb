class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :wod_prototype_id
      t.integer :wod_id
      t.string :name
      t.integer :position

      t.timestamps
    end
    add_index :groups, [:wod_prototype_id, :wod_id, :name, :position ], unique: true, name: 'group_index'
  end
end
