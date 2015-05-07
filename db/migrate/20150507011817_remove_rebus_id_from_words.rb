class RemoveRebusIdFromWords < ActiveRecord::Migration
  def change
    remove_column :words, :rebus_id
  end
end
