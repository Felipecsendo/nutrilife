class Category < ApplicationRecord
  audited

  # Associations
  belongs_to :admin
  has_many :posts, dependent: :destroy

  # Carrierwave uploader
  mount_uploader :avatar, AvatarUploader
end
