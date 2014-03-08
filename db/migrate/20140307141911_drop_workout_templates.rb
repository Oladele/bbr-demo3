class DropWorkoutTemplates < ActiveRecord::Migration
  def change
  	drop_table :workout_templates
  end
end
