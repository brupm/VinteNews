class User < ActiveRecord::Base
  validates :login,  :presence => true
  validates :password, :presence => true
  validates :email, :presence => true, :uniqueness => true, :email_format => true
  
  acts_as_authentic do |c|
    c.require_password_confirmation = false # There is no login field, so don't validate it
  end
  
  has_many :posts
  has_many :comments
end