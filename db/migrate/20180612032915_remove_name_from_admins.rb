class RemoveNameFromAdmins < ActiveRecord::Migration[5.2]
  def change
    remove_column :admins, :name, :string
  end
end
