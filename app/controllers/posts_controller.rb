class PostsController < ApplicationController
  before_filter :require_user, :except => [:index, :show]
  before_filter :find_post, :only => [:show, :edit, :update, :destroy]

  def index
    if params[:user_id]
      @posts = User.find_by_login(params[:user_id]).posts
    elsif params[:order] == "latest"
      @posts = Post.latest.pop(100)
    else
      @posts = Post.all.sort_by{ |p| p.votes_for }.pop(20).reverse
      #@posts = Post.find_by_sql("select p.*, SUM(vote) as votes_count FROM votes v, posts p where p.id = v.`voteable_id` AND v.`voteable_type` = 'Post' group by v.voteable_id order by votes_count DESC limit 20")
    end
      
    respond_to do |format|
      format.html
      format.rss { render :layout => false } #index.rss.builder
    end    
  end

  def new
    @post = Post.new
    @post.title = params[:title].strip unless params[:title].blank?    
    @post.url = params[:url].blank? ? "http://" : params[:url]        
  end

  def create
    if params[:link].blank?
      @post = current_user.posts.create(params[:post])
      if @post.save
        flash[:notice] = I18n.t('posts_controller.messages.post_submitted')
        redirect_to root_path
      else
        render :action => 'new'
      end
    else
      flash[:error] = I18n.t("messages.spammer")
      redirect_to root_path      
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
  
  def destroy
    if current_user.try(:admin?)      
      @post.mark_as_deleted
      @post.comments.each do |comment|
        comment.mark_as_deleted
      end
    end
    redirect_to root_path
  end

  def find_post
    @post = Post.find(params[:id])
  end

end
