class CreateRebusWords < ActiveRecord::Migration
  def change
    create_table :rebus_words do |t|
      t.integer :rebus_id
      t.integer :word_id
      t.integer :placement
    end
  end
end
