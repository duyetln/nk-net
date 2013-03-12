class TaggingsController < ApplicationController
  
  before_filter :require_admin_user

  def create
    
    Tagging.delete_all(["taggable_type = ? AND taggable_id = ?", params[:taggable_type], params[:taggable_id]])
    
    params[:tag_ids].each do |id|
      tagging = Tagging.new
      tagging.tag_id = id
      tagging.taggable_id = params[:taggable_id]
      tagging.taggable_type = params[:taggable_type]
      tagging.save
    end
      
    redirect_to :back
  end
  
  def destroy
    @tagging = Tagging.find(params[:id])
    if @tagging.destroy
      redirect_to :back
    else
      redirect_to :back
    end
  end
end
