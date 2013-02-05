class TaggingsController < ApplicationController
  
  before_filter :require_admin_user

  def create
    @tagging = Tagging.new
    @tagging.tag_id = params[:tag_id]
    @tagging.taggable_id = params[:taggable_id]
    @tagging.taggable_type = params[:taggable_type]
      
    if @tagging.save
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
  def destroy
    @tagging = Tagging.find(params[:id])
    if @tagging.destroy
      render :nothing => true
    else
      render :nothing => true
    end
  end
end
