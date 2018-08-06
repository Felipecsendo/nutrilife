class AdminProfile < ApplicationRecord
  # Validations
  validates :name, :description, presence: true
  validate :image_attachment, :image_type

  # Associations
  belongs_to :admin
  audited associated_with: :admin

  # Active Storage Attachment
  has_one_attached :avatar

  private

  def image_attachment
    message = I18n.translate('messages.cannot_be_blank')
    errors.add(:avatar, message) unless avatar.attached?
  end

  def image_type
    m = I18n.translate('messages.must_be_jpeg_or_png')
    type = %w[image/jpeg image/png]

    errors.add(:avatar, m) if avatar.attached? && !avatar.content_type.in?(type)
  end
end
