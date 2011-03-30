class User < ActiveRecord::Base
  acts_as_voter

  has_many :posts
  has_many :comments
  has_karma :posts

  validates :login,  :presence => true
  validates :password, :presence => true, :on => :create

  acts_as_authentic do |c|
    c.require_password_confirmation = false
    c.merge_validates_format_of_email_field_options :message => I18n.t('user_model.validations.email_format')
    c.merge_validates_format_of_login_field_options :message => I18n.t('user_model.validations.login_format')
  end

  def to_param
    login
  end
  
  def admin?
    login == "brupm" || login == "ibias" || login == "daviscabral" || login == "roberto" || login == "ozeias"
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
#  about             :text
#

