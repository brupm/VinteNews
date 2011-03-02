class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy  
  
  def new
    @user_session = UserSession.new

    respond_to do |format|
      format.html
      format.xml  { render :xml => @user_session }
    end
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Successfully logged in."
      redirect_to root_path, :format => params[:format]
    else
      render :action => 'new', :format => params[:format]
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    flash[:notice] = "Successfully logged out."
    redirect_to login_path, :format => params[:format]
  end

end