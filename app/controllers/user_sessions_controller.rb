class UserSessionsController < ApplicationController

  skip_before_filter :require_login, :require_activated_user, :only => :create
  before_filter :require_no_login, :only => :create

  def create
    @user_session = UserSession.new(params[:user_session])
    redirect_to root_path unless @user_session.save
    
    user = @user_session.user
    user.activate if user.deactivated?
    if user.activated?
      redirect_to posts_path
    else
      @user_session.destroy
      redirect_to root_path
    end
  end
  
  def destroy
    current_user_session.destroy
    redirect_to root_path
  end

end
