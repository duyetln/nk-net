class PicturesController < ApplicationController

  def index
    @pictures = Picture.order("created_at DESC")
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
  end
  
  def destroy
    @picture = Picture.find(params[:id])
    
    if (@picture.user == current_user || current_user.has_role?(:admin)) && @picture.destroy
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
end
