class Category < ApplicationRecord
  # Associations
  has_many :blogs, dependent: :destroy

  # Carrierwave uploader
  mount_uploader :avatar, AvatarUploader
end
