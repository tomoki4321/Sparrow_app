class Post < ApplicationRecord
  mount_uploader :picture, ImageUploader
  validates :content,presence: true
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
