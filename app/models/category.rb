class Category < ApplicationRecord
  audited

  # Associations
  belongs_to :admin
  has_many :posts, dependent: :destroy

  # Active Storage Attachment
  has_one_attached :cover
end
