class CreateRebuses < ActiveRecord::Migration
  def change
    create_table :rebuses do |t|
      t.text :words
      t.text :images
      t.text :input_text
      t.timestamps null: false
    end
  end
end
