class Blog < ApplicationRecord
  belongs_to :user, optional: true, foreign_key: 'user_id'
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader
end
