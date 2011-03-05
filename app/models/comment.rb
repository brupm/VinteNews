class Comment < ActiveRecord::Base
  belongs_to :comment
  belongs_to :user

  validates :user_id, :presence => true
  validates :post_id, :presence => true
  validates :body, :presence => true
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

