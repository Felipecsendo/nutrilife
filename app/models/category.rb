class Category < ApplicationRecord
  # Associations
  has_many :blogs
  
  # Carrierwave uploader
  mount_uploader :avatar, AvatarUploader
end
