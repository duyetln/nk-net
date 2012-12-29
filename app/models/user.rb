class User < ActiveRecord::Base
  #types
  Role = {:regular => 1, :admin => 2}
  
  #status
  Status = {:new => 1, :activated => 2, :deactivated => 4, :suspended => 8}

  #authlogic
  acts_as_authentic
  
  #associations
  belongs_to :avatar, :class_name => 'Picture', :foreign_key => 'picture_id'
  has_many :pictures, :dependent => :destroy
  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  
  #validations
  validates :first_name, :presence => true
  validates :first_name, :format => {:with => /\A[a-z]{2,}\Z/i }
  validates :last_name, :presence => true
  validates :last_name, :format => {:with => /\A[a-z]{2,}\Z/i }
  
  #authlogic will handle these 
  #validates :email, :presence => true
  #validates :email, :uniqueness => {:case_sensitive => false}
  #validates :email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  #validates :password, :presence => true
  validates :role, :presence => true
  validates :role, :inclusion => {:in => Role.values}
  validates :status, :presence => true
  validates :status, :inclusion => {:in => Status.values}
  
  #access control
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  
end
