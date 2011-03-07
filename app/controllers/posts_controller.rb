class PostsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  before_filter :find_post, :only => [:show, :edit, :update]

  def index
    if params[:user_id]
      @posts = User.find(params[:user_id]).posts
    else
      @posts = Post.active
    end
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(params[:post])
    if @post.save
      flash[:notice] = "Your article has been submitted."
      redirect_to root_path
    else
      flash[:notice] = "There was a problem saving your article."
      render :action => 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if current_user.posts.find(params[:id]).update_attributes(params[:post])
      flash[:notice] = "Your post was updated successfully."
      redirect_to post_path(@post)
    else
      flash[:notice] = "There was a problem updating your post."
      render :action => 'edit'
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
