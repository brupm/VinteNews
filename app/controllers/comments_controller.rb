class CommentsController < ApplicationController
  before_filter :find_or_create_comment, :except => [:index]
  before_filter :require_user, :except => [:show]
  
  def index
    if params[:user_id]
      @comments = User.find_by_login(params[:user_id]).comments
    end
  end
    
  def show  
  end
  
  def new
  end
  
  def create
    respond_to do |format|
      if @comment.save
        format.html { redirect_to(@post) }
        format.xml  { render :xml => @comment, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  protected
    def find_or_create_comment
      @post = Post.find(params[:post_id])
      if params[:id]
        @comment = @post.comments.find(params[:id])
      else
        @comment = @post.comments.build(params[:comment])
        @comment.user = current_user
      end
    end
  
end