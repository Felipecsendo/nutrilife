class Category < ApplicationRecord
  audited

  # Associations
  has_many :posts, dependent: :destroy

  # Carrierwave uploader
  mount_uploader :avatar, AvatarUploader
end
