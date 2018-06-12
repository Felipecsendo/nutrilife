class AddAdminRefToAdminProfiles < ActiveRecord::Migration[5.2]
  def change
    add_reference :admin_profiles, :admin, foreign_key: true
  end
end
