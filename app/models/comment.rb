class Comment < ActiveRecord::Base

  #assocations
  belongs_to :user
  belongs_to :commentable, :polymorphic => true
  
  #validations
  validates :user, :presence => true
  validates :commentable, :presence => true
  validates :content, :presence => true
  validates :user_id, :presence => true
  validates :commentable_id, :presence => true
  validates :commentable_type, :presence => true
  
  #access control
  attr_accessible :content
  
end
