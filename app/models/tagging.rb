class Tagging < ActiveRecord::Base
  
  #associations
  belongs_to :tag
  belongs_to :taggable, :polymorphic => true #only tag pictures and posts
  
  #validations
  validates :tag, :presence => true
  validates :taggable, :presence => true
  validates :tag_id, :presence => true
  validates :taggable_id, :presence => true
  validates :taggable_id, :uniqueness => {:scope => [:tag_id, :taggable_type]}
  validates :taggable_type, :presence => true
  validates :taggable_type, :inclusion => {:in => [Post.name, Picture.name]}
  
  #access control
  attr_accessible

end
