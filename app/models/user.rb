class User < ApplicationRecord
  mount_uploader :avatar, PictureUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :validatable
  has_many :postings, dependent: :destroy
  has_many :comments, dependent: :destroy
  # User Avatar Validation
  validates_integrity_of  :avatar
  validates_processing_of :avatar

  acts_as_voter

  private
  def avatar_size_validation
  errors[:avatar] << "should be less than 500KB" if avatar.size > 0.5.megabytes
  end


end
