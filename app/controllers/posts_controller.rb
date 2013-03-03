class PostsController < ApplicationController

  def index
    if params[:user_id].nil?
      @user = nil
      @posts = Post.order("created_at DESC")
    else
      @user = User.find(params[:user_id])
      @posts = @user.posts.order("created_at DESC")
    end
  end
  
  def create
    @post = Post.new(params[:post])
    @post.user_id = current_user.id
    
    if @post.save
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    
    if (@post.user == current_user || current_user.has_role?(:admin)) && @post.destroy
      redirect_to posts_path
    else
      redirect_to posts_path
    end
  end

end
