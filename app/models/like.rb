class Like < ApplicationRecord
  belongs_to :user
  acts_as_voter
  
end
