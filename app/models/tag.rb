class Tag < ActiveRecord::Base

  #associations
  has_many :taggings, :dependent => :destroy
  has_many :pictures, :through => :taggings, :source => :taggable, :source_type => 'Picture'
  has_many :posts, :through => :taggings, :source => :taggable, :source_type => 'Post'
  
  #validations
  validates :value, :presence => true
  validates :value, :uniqueness => {:case_sensitive => false}
  validates :value, :format => {:with => /\A[a-z][-\w]*/i }
  
  #access control
  attr_accessible :value
  
  def taggables
    self.posts + self.pictures
  end
  
end
