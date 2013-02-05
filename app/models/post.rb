require 'search.rb'

class Post < ActiveRecord::Base
  include Search::ByTag

  #associations
  belongs_to :user
  has_many :taggings, :as => :taggable, :dependent => :destroy
  has_many :tags, :through => :taggings, :as => :taggable
  has_many :comments, :as => :commentable, :dependent => :destroy
  
  #validations
  validates :content, :presence => true
  validates :user, :presence => true
  validates :user_id, :presence => true
  
  #access control
  attr_accessible :content
  
end
