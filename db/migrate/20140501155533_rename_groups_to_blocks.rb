class RenameGroupsToBlocks < ActiveRecord::Migration
  def change
    rename_table :groups, :blocks
  end
end
