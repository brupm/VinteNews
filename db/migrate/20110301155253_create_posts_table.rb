class CreatePostsTable < ActiveRecord::Migration
  def self.up
    create_table :posts, :force => true do |t|
      t.integer :user_id
      t.string :title
      t.string :url
      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end