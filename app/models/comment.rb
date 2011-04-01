class Comment < ActiveRecord::Base
  acts_as_voteable
    
  belongs_to :parent, :class_name => "Comment", :foreign_key => :parent_id
  has_many :sub_comments, :class_name => "Comment", :foreign_key => :parent_id
  belongs_to :post
  belongs_to :user
  #has_karma :posts
  
  validates :user_id, :presence => true
  validates :post_id, :presence => true
  validates :body, :presence => true, :length => { :within => 2..10000 }
  
  default_scope where(:status => nil)

  scope :top_level, lambda {  where("comments.parent_id IS NULL") }
  scope :latest, order("created_at DESC")
  scope :last_100, order("created_at DESC").limit(100)
  
  def mark_as_deleted
    self.status = "deleted"
    self.save
  end
  
  def votes_count
    votes = votes_for      
    if self.sub_comments.count > 0 
      votes += eval(self.sub_comments.map(&:votes_for).join("+"))
    end
    
    #while       
    #  votes + votes_count
    #end
    
    votes
  end
  
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
#  parent_id  :integer(4)
#  status     :string(255)
#

