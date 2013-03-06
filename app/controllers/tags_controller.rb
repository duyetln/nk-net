class TagsController < ApplicationController
  
  before_filter :require_admin_user, :except => [:index, :show]
  
  def index
    @tags = Tag.all
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      redirect_to tags_path
    else
      redirect_to tags_path
    end
  end
  
  def show
    @tag = Tag.find(params[:id])
    @posts = @tag.posts
    @pictures = @tag.pictures
  end
  
  def update
    @tag = Tag.find(params[:id])
    @tag.attributes = params[:tag]
    if @tag.save
      redirect_to tag_path(@tag)
    else
      redirect_to tag_path(@tag)
    end
  end
  
  def destroy
    @tag = Tag.find(params[:id])
    if @tag.destroy
      redirect_to tags_path
    else
      redirect_to tags_path
    end
  end
end
