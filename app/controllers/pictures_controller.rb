class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
    render :nothing => true
  end
  
  def create
    @picture = Picture.new(params[:picture])
    @picture.user_id = current_user.id
    
    if @picture.save
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
  def show
    @picture = Picture.find(params[:id])
    render :nothing => true
  end
  
  def destroy
    @picture = Picture.find(params[:id])
    
    if (@picture.user == current_user || current_user.has_role?(:admin)) && @picture.destroy
      @picture.user.picture_id = nil if @picture.user.picture_id == @picture.id
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
end
