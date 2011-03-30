class PagesController < ApplicationController
  def about
    
  end
  
  def lists
    @popular_users = User.all(:limit => 20).sort_by { |u| u.karma }.reverse
  end
end