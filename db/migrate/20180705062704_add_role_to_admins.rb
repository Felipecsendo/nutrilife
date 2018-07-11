class AddRoleToAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :admins, :role, :Integer, default: 1
  end
end
