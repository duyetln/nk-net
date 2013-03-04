class PicturesController < ApplicationController

  def index
    @pictures = Picture.order("created_at DESC")
    @pictures = @pictures.select{|picture| picture.user.activated?} if !current_user.admin?
  end
  
  def create
    @picture = Picture.new(params[:picture])
    @picture.user_id = current_user.id
    
    if @picture.save
      redirect_to :back
    else
      redirect_to :back
    end
  end
  
  def show
    @picture = Picture.find(params[:id])
    redirect_to pictures_path if !current_user.admin? && !@picture.user.activated?
    @comments = @picture.comments.select{|comment| comment.user.activated?}
  end
  
  def destroy
    @picture = Picture.find(params[:id])
    
    if (@picture.user == current_user || current_user.admin?) && @picture.destroy
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
end
