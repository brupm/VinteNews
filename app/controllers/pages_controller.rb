class PagesController < ApplicationController
  def about
    
  end
  
  def lists
    @popular_users = User.all(:limit => 20).reject{ |u| u.karma < 2}.sort_by { |u| u.karma }.reverse
  end
end