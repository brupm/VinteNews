# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user, :error_messages

  private

  def error_messages(instance)
  end

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

  def require_user
    unless current_user
      store_location
      redirect_to new_user_session_url, :notice => I18n.t('application_controller.messages.must_be_logged_in')
      return false
    end
  end

  def require_no_user
    if current_user
      store_location
      redirect_to root_url, :notice => I18n.t('application_controller.messages.must_be_logged_in')
      return false
    end
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end

end
