class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user_session, :current_user
  
  before_filter :require_login, :require_activated_user
  
  private
  
  def current_user_session
    return @current_user_session if defined? @current_user_session
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined? @current_user
    @current_user = current_user_session && current_user_session.user
  end
  
  def require_login
    unless current_user
      render :nothing => true
    end
  end
  
  def require_no_login
    if current_user
      render :nothing => true
    end
  end
  
  def require_activated_user
    unless current_user.has_status?(:activated)
      render :nothing => true
    end
  end
  
  def require_admin_user
    unless current_user.has_role?(:admin)
      render :nothing => true
    end
  end
  
end
