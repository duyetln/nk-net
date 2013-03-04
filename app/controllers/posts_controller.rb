class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at DESC")
    @posts = @posts.select{|post| post.user.has_status?(:activated)} if !current_user.has_role?(:admin)
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
    redirect_to posts_path if !current_user.has_role?(:admin) && !@post.user.has_role?(:activated)
    @comments = @post.comments.select{|comment| comment.user.has_status?(:activated)}
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
