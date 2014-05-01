class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :setts, :group_id, :block_id
  end
end