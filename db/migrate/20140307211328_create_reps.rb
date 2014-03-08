class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.integer :sett_id
      t.integer :exercise_id
      t.decimal :resistance
      t.integer :position

      t.timestamps
    end
    add_index :reps, [:sett_id, :exercise_id, :position ]
  end
end
