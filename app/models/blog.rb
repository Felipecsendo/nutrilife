class Blog < ApplicationRecord
  # Validations
  validates :title, :body, :images, :admin, :category_id, presence: true

  # Associations
  belongs_to :admin
  belongs_to :category

  # Carrierwave uploader
  mount_uploaders :images, ImageUploader
  serialize :images, JSON # If you use SQLite, add this line.
end

# a.image = Rails.root.join('public/Nutritionist.jpg').open
