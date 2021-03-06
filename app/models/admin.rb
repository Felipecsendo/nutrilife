class Admin < ApplicationRecord
  enum role: { full_access: 0, restricted_access: 1 }
  audited only: %i[email role]

  # Associations
  has_many :posts, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_associated_audits
  has_one :admin_profile, dependent: :destroy

  accepts_nested_attributes_for :admin_profile, update_only: true

  # Scopes
  scope :with_full_access, -> { where role: 0 }
  scope :with_restricted_access, -> { where role: 1 }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
