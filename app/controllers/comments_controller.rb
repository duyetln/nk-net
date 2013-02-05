class CommentsController < ApplicationController

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = current_user.id
    @comment.commentable_id = params[:commentable_id]
    @comment.commentable_type = params[:commentable_type]
    
    if @comment.save
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    if (@comment.user == current_user || current_user.has_role?(:admin)) && @comment.destroy
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
end
