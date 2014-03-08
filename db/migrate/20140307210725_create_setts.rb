class CreateSetts < ActiveRecord::Migration
  def change
    create_table :setts do |t|
      t.integer :group_id
      t.integer :position

      t.timestamps
    end
    add_index :setts, [:group_id, :position ]
  end
end
