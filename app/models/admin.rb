class Admin < ApplicationRecord
  # Associations
  has_many :blogs, dependent: :destroy
  has_one :admin_profile, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
