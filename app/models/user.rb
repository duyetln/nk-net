class User < ActiveRecord::Base
  #types
  Role = {:regular => 1, :admin => 2}
  
  #status
  Status = {:new => 1, :activated => 2, :deactivated => 3, :suspended => 4}

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
  validates :role, :presence => true
  validates :role, :numericality => {:greater_than => 0, :less_than => (2**(Math::log(Role.values.max,2).floor+1))}
  validates :status, :presence => true
  validates :status, :inclusion => {:in => Status.values}
  
  #callbacks
  before_save :clean_name
  
  #access control
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  
  def has_role?(role)
    return false if !Role.keys.include? role
    self.role & Role[role] > 0
  end
  
  def has_status?(status)
    return false if !Status.keys.include? status
    self.status == Status[status]
  end
  
  def name
    self.first_name + ' ' + self.last_name
  end
  
  private
  
  def clean_name
    self.first_name = self.first_name.strip.capitalize
    self.last_name = self.last_name.strip.capitalize
  end
end
