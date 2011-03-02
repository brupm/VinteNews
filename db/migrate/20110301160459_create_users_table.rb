class CreateUsersTable < ActiveRecord::Migration
  def self.up
    create_table :users, :force => true do |t|
      t.string :login
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :login_count
      t.datetime :last_login_at
      t.string :current_login_ip
      t.string :last_login_ip
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end