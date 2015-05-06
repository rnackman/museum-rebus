class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :display_text
      t.string :image_url
    end
  end
end
