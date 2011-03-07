class AddIndexesToPosts < ActiveRecord::Migration
  def self.up
    add_index :posts, :user_id
    add_index :posts, :status
    add_index :posts, [:user_id, :status]
  end

  def self.down
    remove_index :posts, :user_id
    remove_index :posts, :status
    remove_index :posts, [:user_id, :status]
  end
end
