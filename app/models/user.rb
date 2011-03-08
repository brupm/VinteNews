class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  
  validates :login,  :presence => true
  validates :password, :presence => true
  validates :email, :presence => true, :uniqueness => true, :email_format => true
  
  acts_as_authentic do |c|
    c.require_password_confirmation = false
    c.merge_validates_format_of_email_field_options :message => 'deve ser um formato correto'
    c.merge_validates_format_of_login_field_options :message => 'deve conter apenas letras, numeros, espacos, e .-_@'    
  end
  
  def to_param
    login
  end
end

# == Schema Information
#
# Table name: users
#
#  id                :integer(4)      not null, primary key
#  login             :string(255)
#  email             :string(255)
#  crypted_password  :string(255)
#  password_salt     :string(255)
#  persistence_token :string(255)
#  login_count       :integer(4)
#  last_login_at     :datetime
#  current_login_ip  :string(255)
#  last_login_ip     :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#

