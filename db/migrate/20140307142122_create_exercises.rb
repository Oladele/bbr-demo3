class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :user_id

      t.timestamps
    end
    add_index :exercises, [:user_id, :name]
  end
end
