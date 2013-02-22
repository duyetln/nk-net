require 'search.rb'

class Picture < ActiveRecord::Base
  include Search::ByTag 
  
  #paperclip
  has_attached_file :item, :styles => {:small => "64", :medium => "200"}

  #associations
  belongs_to :user
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings, :as => :taggable
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  #validations
  validates :user, :presence => true
  validates :user_id, :presence => true
  validates :width, :numericality => {:greater_than => 50}
  validates :height, :numericality => {:greater_than => 50}
  validates_attachment :item, :presence => true
  validates_attachment :item, :content_type => {:content_type => ["image/jpg","image/png","image/jpeg"]}
  
  #callbacks
  before_validation :set_dimensions
  before_destroy :remove_avatar, :remove_file
  
  #access control
  attr_accessible :item, :description, :width, :height
  
  private 
  
  def set_dimensions
    geometry = Paperclip::Geometry.from_file(self.item.queued_for_write[:original].path)
    self.width = geometry.width
    self.height = geometry.height
  end
  
  def remove_avatar
    if self.user.picture_id == self.id
      self.user.picture_id = nil
      self.user.save
    end
  end
  
  def remove_file
    self.item.destroy
  end
  
end
