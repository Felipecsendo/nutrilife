class AdminProfile < ApplicationRecord
  # Validations
  validates :name, :description, :avatar, presence: true

  # Associations
  belongs_to :admin
  audited associated_with: :admin

  # Active Storage Attachment
  has_one_attached :avatar
end
