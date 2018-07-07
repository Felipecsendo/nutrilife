class Category < ApplicationRecord
  # Associations
  has_many :posts, dependent: :destroy

  # Carrierwave uploader
  mount_uploader :avatar, AvatarUploader
end
