class CreatePostings < ActiveRecord::Migration[5.2]
  def self.up
    create_table :postings do |t|
      t.string :description
      t.integer :likes_counter

      t.timestamps
    end
  end
  def self.down
  drop_table :postings
  end
end
