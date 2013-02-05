class TagsController < ApplicationController
  
  before_filter :require_admin_user

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
  def update
    @tag = Tag.find(params[:id])
    @tag.attributes = params[:tag]
    if @tag.save
      render :nothing => true
    else
      render :nothing => true
    end
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      render :nothing => true
    else
      render :nothing => true
    end
  end
end
