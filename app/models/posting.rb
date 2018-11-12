class Posting < ApplicationRecord
  has_many :likes
  mount_uploader :picture, PictureUploader

  validates :description, presence: true

  belongs_to :user
  acts_as_votable

end
