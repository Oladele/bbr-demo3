class CreateWodPrototypes < ActiveRecord::Migration
  def change
    create_table :wod_prototypes do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
    add_index :wod_prototypes, [:user_id, :name]
  end
end
