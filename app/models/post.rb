class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :title, :presence => true, :uniqueness => true
  validates :url, :url_format => true
  validates :url, :presence => true, :if => Proc.new { |a| a.body.blank? }
  validates :body, :length => { :within => 20..10000 }, :allow_blank => true, :if => Proc.new { |a| a.url.blank? }
  
  scope :active, lambda { where("posts.status IS NULL") }
  
end
# == Schema Information
#
# Table name: posts
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  title      :string(255)
#  url        :string(255)
#  created_at :datetime
#  updated_at :datetime
#  body       :text
#

