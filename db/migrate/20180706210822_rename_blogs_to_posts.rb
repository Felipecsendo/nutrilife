class RenameBlogsToPosts < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :blogs, :posts
  end

  def self.down
    rename_table :posts, :blogs
  end
end
