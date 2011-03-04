class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  
  validates_presence_of :title
  validates_length_of :title, :within => 5..100
  validates_presence_of :url, :allow_blank => true
  validates_presence_of :body, :allow_blank => true
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

