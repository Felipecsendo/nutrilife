class AddAvatarToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :avatar, :string
  end
end
