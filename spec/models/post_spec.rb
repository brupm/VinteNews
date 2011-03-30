require 'spec_helper'

describe Post do 
  fixtures :posts
  
  it "should have a title"
  
  it "should have a url"
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
#  status     :string(255)
#

