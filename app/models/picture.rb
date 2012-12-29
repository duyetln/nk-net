require 'search.rb'

class Picture < ActiveRecord::Base
  include Search::ByTag 
  
  #paperclip
  has_attached_file :data

  #associations
  belongs_to :user
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings, :as => :taggable
  has_many :comment, :as => :commentable, :dependent => :destroy
  
  #validations
  validates :user, :presence => true
  validates :user_id, :presence => true
  
  #access control
  attr_accessible :data
  
end
