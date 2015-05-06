class RemoveColumnsFromRebuses < ActiveRecord::Migration
  def change
    remove_column :rebuses, :words
    remove_column :rebuses, :images
  end
end
