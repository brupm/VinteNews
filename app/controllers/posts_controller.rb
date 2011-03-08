class PostsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  before_filter :find_post, :only => [:show, :edit, :update]

  def index
    if params[:user_id]
      @posts = User.find_by_login(params[:user_id]).posts
    else
      @posts = Post.active
    end
  end

  def new
    @post = Post.new
    @post.url ||= "http://"
  end

  def create
    @post = current_user.posts.create(params[:post])
    if @post.save
      flash[:notice] = I18n.t('posts_controller.messages.post_submitted')
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def show
    @comment = Comment.new
  end

  def edit

  end

  def update
    if current_user.posts.find(params[:id]).update_attributes(params[:post])
      flash[:notice] = I18n.t('posts_controller.messages.post_updated')
      redirect_to post_path(@post)
    else
      flash[:notice] = I18n.t('posts_controller.messages.post_update_problem')
      render :action => 'edit'
    end
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
