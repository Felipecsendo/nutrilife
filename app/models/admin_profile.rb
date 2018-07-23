class AdminProfile < ApplicationRecord
  # Validations
  validates :name, :description, :avatar, presence: true

  # Associations
  belongs_to :admin
  audited associated_with: :admin
  # Carrierwave Uploader
  mount_uploader :avatar, AvatarUploader
end
