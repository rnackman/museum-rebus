class AddRebusIdToWords < ActiveRecord::Migration
  def change
    add_column :words, :rebus_id, :integer
  end
end
