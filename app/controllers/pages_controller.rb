class PagesController < ApplicationController

  layout false
  skip_before_filter :require_login, :require_activated_user

  def main   
    redirect_to posts_path and return if current_user && current_user.activated?
  end
  
end
