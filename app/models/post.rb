class Post < ApplicationRecord
  # Validations
  validates :title, :body, :images, :admin, :category_id, presence: true

  # Associations
  belongs_to :admin
  belongs_to :category

  # Carrierwave uploader
  mount_uploaders :images, ImageUploader
  serialize :images, JSON # If you use SQLite, add this line.
end
