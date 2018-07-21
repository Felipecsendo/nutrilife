class AdminProfile < ApplicationRecord
  audited

  # Validations
  validates :name, :description, :avatar, presence: true

  # Associations
  belongs_to :admin

  # Carrierwave Uploader
  mount_uploader :avatar, AvatarUploader
end
