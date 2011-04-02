require 'spec_helper'

describe Comment do
  fixtures :all
  
  it "should have child associations" do
    comment = comments(:child_comment)
    comment.user.should_not be_nil
    comment.post.should_not be_nil 
    comment.sub_comments.should == []
    comment.parent.should_not be_nil
  end
  
  it "should have parent associations" do      
    comment = comments(:url_comment)
    comment.sub_comments.should == [comments(:child_comment)]
    comment.parent.should be_nil    
  end
  
  it "should validate main fields" do
    comment = Comment.create
    comment.errors[:user_id].should_not be_nil
    comment.errors[:post_id].should_not be_nil
    comment.errors[:body].should_not be_nil        
  end
  
  it "shold be edited/destroyed within 15 minutes of creation" 
  
  it "shoud not be destroyed if there are child comments"
  
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

