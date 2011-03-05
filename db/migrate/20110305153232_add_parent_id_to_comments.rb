class AddParentIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :parent_id, :integer
    add_index :comments, :parent_id
    add_index :comments, :post_id
    add_index :comments, :user_id
  end

  def self.down
    remove_column :comments, :parent_id
  end
end
