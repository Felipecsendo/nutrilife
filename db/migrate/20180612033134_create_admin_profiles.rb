class CreateAdminProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_profiles do |t|
      t.string :name
      t.string :avatar
      t.string :description

      t.timestamps
    end
  end
end
