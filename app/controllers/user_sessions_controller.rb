# encoding: utf-8
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
      redirect_to root_path, :notice => I18n.t('user_sessions_controller.messages.logged_in')
    else
      render :action => 'new'
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to login_path, :format => params[:format], :notice => I18n.t('user_sessions_controller.messages.logged_out')
  end

end
