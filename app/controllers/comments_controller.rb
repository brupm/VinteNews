class CommentsController < ApplicationController
  before_filter :find_or_create_comment, :except => [:index, :destroy]
  before_filter :require_user, :except => [:show]
  
  def index
    if params[:user_id]
      @comments = User.find_by_login(params[:user_id]).comments
    else
      @comments = Comment.latest.sort_by{ |c| c.votes_for }.reverse
    end
  end
    
  def show  
  end
  
  def new
  end
  
  def create
    if params[:link].blank?
      respond_to do |format|
        if @comment.save
          format.html { redirect_to(@post) }
          format.xml  { render :xml => @comment, :status => :created, :location => @post }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
        end
      end
    else 
      flash[:error] = I18n.t("messages.spammer")
      redirect_to root_path
    end  
  end
  
  def destroy
    if current_user.try(:admin?)
      @comment = Comment.find(params[:id])
      @comment.status = "deleted"
      @comment.save
    end
    redirect_to @comment.post
  end
  
  protected
    def find_or_create_comment
      if params[:post_id]
        @post = Post.find(params[:post_id])
      end
      if params[:id]
        @comment = Comment.find(params[:id])
      else
        @comment = @post.comments.build(params[:comment])
        @comment.user = current_user
      end
    end
  
end