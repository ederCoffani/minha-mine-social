class AddPictureToPostings < ActiveRecord::Migration[5.2]
  def change
    add_column :postings, :picture, :string
  end
end
