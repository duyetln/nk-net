class UserSessionsController < ApplicationController

  skip_before_filter :require_login, :require_activated_user, :only => :create
  before_filter :require_no_login, :only => :create

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
  def destroy
    current_user_session.destroy
    render :nothing => true
  end

end
