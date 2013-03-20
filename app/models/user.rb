class User < ActiveRecord::Base
  #types
  Role =  {:regular => 0, :admin => 1}
  
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
  validates :role, :numericality => {:greater_than_or_equal_to => 0, :less_than => (2**(Math::log(Role.values.max,2).floor+1))}
  validates :status, :presence => true
  validates :status, :inclusion => {:in => Status.values}
  
  #callbacks
  before_save :clean_name
  
  #access control
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation
  
  def have_role?(role)
    return false if !Role.keys.include? role
    self.role & Role[role] > 0
  end
  
  #given a list of roles, determine if a user has ALL of them
  def have_roles?(roles)
    roles = roles.compact.select{|role| Role.keys.include? role}
    return false if roles.empty?
    
    have = true
    roles.each do |role|
      have &&= self.have_role?(role)
      return have unless have
    end
    have
  end
  
  #given a list of roles, grant these roles (overwrite) to a user
  #note: if a role doesn't exist, it is skipped
  def overwrite_roles(roles)
    set_roles(roles)
  end
  
  #same as set_roles but doesn't overwrite
  def add_roles(roles)
    set_roles(roles, self.role)
  end
  
  def remove_roles(roles)
    roles = roles.compact.select{|role| Role.keys.include? role}
    return false if roles.empty?
    
    roles.each do |role|
      self.role &= ~Role[role]
    end
    self.save
  end
  
  def have_no_role?
    self.role == 0
  end
  
  def roles
    if self.have_no_role? 
      [:regular]
    else
      User::Role.keys.reject{|role| role == :regular}.select{|role| self.have_role?(role)}
    end
  end
  
  def admin?
    self.have_role?(:admin)
  end
  
  def regular?
    self.have_no_role?
  end
  
  def have_status?(status)
    return false if !Status.keys.include? status
    self.status == Status[status]
  end
  
  def new?
    self.have_status?(:new)
  end
  
  def activated?
    self.have_status?(:activated)
  end
  
  def deactivated?
    self.have_status?(:deactivated)
  end
  
  def suspended?
    self.have_status?(:suspended)
  end
  
  def set_status(status)
    return false if !Status.keys.include? status
    self.status = Status[status]
    self.save
  end
  
  def activate
    self.set_status(:activated)
  end
  
  def deactivate
    self.set_status(:deactivated)
  end
  
  def suspend
    self.set_status(:suspended)
  end
  
  def name
    self.first_name + ' ' + self.last_name
  end
  
  private
  
  def clean_name
    self.first_name = self.first_name.strip.capitalize
    self.last_name = self.last_name.strip.capitalize
  end
  
  def set_roles(roles, init_value = 0)
    roles = roles.compact.select{|role| Role.keys.include? role}
    return false if roles.empty?
     
    role_value = init_value
    roles.each do |role|
      role_value |= Role[role]
    end
    self.role = role_value
    self.save
  end
  
end
