class AdminProfile < ApplicationRecord
  # Associations
  belongs_to :admin

  # Carrierwave Uploader
  mount_uploader :avatar, AvatarUploader
end
