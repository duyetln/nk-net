class PostsController < ApplicationController

  def index
    @posts = Post.all
    render :nothing => true
  end
  
  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    
    if @post.save
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
  def show
    @post = Post.find(params[:id])
    render :nothing => true
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if (@post.user == current_user || current_user.has_role?(:admin)) && @post.destroy
      render :nothing => true
    else
      render :nothing => true
    end
  end

end
