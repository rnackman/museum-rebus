class AddColumnImagesToWords < ActiveRecord::Migration
  def change
    add_column :words, :images, :text
  end
end
