class UsersController < ApplicationController

  skip_before_filter :require_login, :require_activated_user, :only => :create

  def create
    if current_user
      create_user_by_admin
    else
      create_user_by_regular
    end
    
    if @user.save
      redirect_to posts_path
    else
      redirect_to root_path
    end
  end
  
  def show
    @user = User.find(params[:id])
    redirect_to user_posts_path(@user)
  end
  
  def edit
    @user = User.find(params[:id])
    redirect_to user_path(@user) and return unless current_user == @user
  end
  
  #Visibility Policy:
  #An admin can see any post/picture and profile page of any user regardless of this user's status
  #A regular user can only see any post/picture and profile page of any activated user
  #Exception: the edit page can be accessed only by owner
  
  def posts
    @user = User.find(params[:id])
    redirect_to posts_path if !current_user.admin? && !@user.activated?
    @posts = @user.posts.order("created_at DESC")
  end
  
  def pictures
    @user = User.find(params[:id])
    redirect_to pictures_path if !current_user.admin? && !@user.activated?
    @pictures = @user.pictures.order("created_at DESC")
  end
  
  def update_status
    @user = User.find(params[:id])
    redirect_to user_path(@user) and return unless current_user == @user || current_user.admin?
    @user.set_status(User::Status.key(params[:status].to_i))
    
    if current_user == @user && @user.deactivated?
      current_user_session.destroy
      redirect_to root_path
    else
      redirect_to user_path(@user)
    end
  end
  
  def update_role
    @user = User.find(params[:id])
    redirect_to user_path(@user) and return unless current_user.admin?
    @user.overwrite_roles([User::Role.key(params[:role].to_i)])
    redirect_to user_path(@user)
  end
  
  def update_password
    @user = User.find(params[:id])
    redirect_to user_path(@user) and return unless current_user == @user
    @user.attributes = params[:user]
    @user.save
    redirect_to user_path(@user)
  end
  
  
  def update
    @user = User.find(params[:id])
    if @user == current_user
      @user.attributes = params[:user]
      @user.status = params[:status]
    end
    
    if current_user.admin?
      @user.role = params[:roles]
      @user.status = params[:status]
    end
    
    if @user.save!
      redirect_to user_path(@user)
    else
      redirect_to user_path(@user)
    end 
  end
  
  private
  
  def create_user_by_admin
    if current_user && current_user.activated? && current_user.admin?
      @user = User.new(params[:user])
      @user.status = params[:status]
      @user.role = params[:roles] #overwrite
    end
  end
  
  def create_user_by_regular
    unless current_user
      @user = User.new(params[:user])
      @user.status = User::Status[:new]
      @user.role = User::Role[:regular]
    end
  end
  
end
