class Posting < ApplicationRecord
  has_many :likes
  has_many :comments, dependent: :destroy
  mount_uploader :picture, PictureUploader

  validates :description, presence: true
  
  belongs_to :user
  acts_as_votable
end
