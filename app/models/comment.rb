class Comment < ActiveRecord::Base
  belongs_to :parent, :class_name => "Comment", :foreign_key => :parent_id
  has_many :comments, :foreign_key => :parent_id
  belongs_to :post
  belongs_to :user
  has_karma :posts
  
  validates :user_id, :presence => true
  validates :post_id, :presence => true
  validates :body, :presence => true, :length => { :within => 2..10000 }
  
end
# == Schema Information
#
# Table name: comments
#
#  id         :integer(4)      not null, primary key
#  post_id    :integer(4)
#  user_id    :integer(4)
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

