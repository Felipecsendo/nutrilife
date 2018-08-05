class Post < ApplicationRecord
  audited

  # Validations
  validates :title, :body, :cover, :admin, :category_id, presence: true

  # Associations
  belongs_to :admin
  audited associated_with: :admin
  belongs_to :category

  # Active Storage Attachment
  has_one_attached :cover
end
