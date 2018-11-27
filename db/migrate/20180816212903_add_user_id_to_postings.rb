class AddUserIdToPostings < ActiveRecord::Migration[5.2]
  def change
    add_reference :postings, :user, foreign_key: true, on_delete: :cascade
  end
end
