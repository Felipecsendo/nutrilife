class Post < ApplicationRecord
  audited

  # Validations
 # validates :title, :body, :images, :admin, :category_id, presence: true

  # Associations
  belongs_to :admin
  audited associated_with: :admin
  belongs_to :category

  # Carrierwave uploader
  mount_uploaders :images, ImageUploader
  serialize :images, JSON # If you use SQLite, add this line.
end
