require 'test_helper'
require 'authlogic/test_case'

class UsersControllerTest < ActionController::TestCase
  
  setup :activate_authlogic 
  
  test 'it should not set role and status on create if no login' do
    post :create, {:user => {:email => 'jkl@domain.com', :password => '123456', :password_confirmation => '123456', :first_name => 'test', :last_name => 'user'}, :status => 2, :roles => 2}
    
    user = User.last
    assert !user.nil?, 'user must exist'
    assert user.email.eql?('jkl@domain.com'), 'email must be equal "jkl@domain.com"'
    assert user.has_role?(:regular) && !user.has_role?(:admin), 'user must be only a regular user'
    assert user.has_status?(:new), 'status must be "new"'
  end
  
  test 'it should set role and status on create if admin login' do
    UserSession.create(users(:ln))
    
    post :create, {:user => {:email => 'xyz@domain.com', :password => '123456', :password_confirmation => '123456', :first_name => 'test', :last_name => 'user'}, :status => 2, :roles => 2} 
  
    user = User.last
    assert !user.nil?, 'user must exist'
    assert user.email.eql?('xyz@domain.com'), 'email must be equal "xyz@domain.com"'
    assert user.has_role?(:admin) && !user.has_role?(:regular), 'user must has role as set by admin'
    assert user.has_status?(:activated), 'user must has status as set by admin'
  end
  
  test 'it should not update role if regular login' do
    UserSession.create(users(:dn))
    user = User.find(users(:dn).id)
    role = user.role
    email = user.email
    
    put :update, {:id => users(:dn).id, :user => {:first_name => 'DDD', :last_name => 'NNN'}, :status => 3, :roles => 2}
    
    user = User.find(users(:dn).id)
    assert !user.nil?, 'user must exist'
    assert user.email.eql?(email), 'email must be unchanged'
    assert user.first_name.eql?('DDD'), 'first name must be "DDD"'
    assert user.last_name.eql?('NNN'), 'last name must be "NNN"'
    assert user.status == 3, 'status must be 3'
    assert user.role == role, 'role must be unchanged'
  end
  
  test 'it should update only role and status if admin login' do
    UserSession.create(users(:ln))
    
    user = User.find(users(:dn).id) #different user
    role = user.role
    first_name = user.first_name
    last_name = user.last_name
    email = user.email
    
    put :update, {:id => users(:dn).id, :user => {:first_name => 'DDD', :last_name => 'NNN'}, :status => 1, :roles => 3}
    
    user = User.find(users(:dn).id)
    assert !user.nil?, 'user must exist'
    assert user.email.eql?(email), 'email must be unchanged'
    assert user.first_name.eql?(first_name), 'first name must be unchanged'
    assert user.last_name.eql?(last_name), 'last name must be unchanged'
    assert user.status == 1, 'status must be 1'
    assert user.role == 3, 'role must be 3'
  end
  
  
end
