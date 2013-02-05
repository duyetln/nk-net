class UsersController < ApplicationController

  skip_before_filter :require_login, :require_activated_user, :only => :create

  def create
    if current_user
      create_user_by_admin
    else
      create_user_by_regular
    end
    
    if @user.save
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
  def show
    @user = User.find(params[:id])
    render :nothing => true
  end
  
  def update
    @user = User.find(params[:id])
    if @user == current_user
      @user.attributes = params[:user]
      @user.status = params[:status]
    end
    
    if current_user.has_role?(:admin)
      @user.role = params[:roles]
      @user.status = params[:status]
    end
    
    if @user.save!
      render :nothing => true
    else
      render :nothing => true
    end 
  end
  
  private
  
  def create_user_by_admin
    if current_user && current_user.has_status?(:activated) && current_user.has_role?(:admin)
      @user = User.new(params[:user])
      @user.status = params[:status]
      @user.role = params[:roles]
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
