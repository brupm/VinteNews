class VotesController < ApplicationController
  before_filter :require_user

  def create
    if params[:post_id]
      @votable = Post.find(params[:post_id])
    elsif params[:comment_id]
      @votable = Comment.find(params[:comment_id])
    end
    current_user.vote_for(@votable)
    flash[:notice] = I18n.t("votes_controller.messages.voted")
    redirect_to request.referrer rescue root_path
  end  
  
end