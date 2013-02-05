require 'test_helper'
require 'authlogic/test_case'

class TagsControllerTest < ActionController::TestCase

  setup :activate_authlogic
  
  test 'it should not create a tag if no admin login' do
    UserSession.create(users(:dn))
    
    post :create, :tag => {:id => 1, :value => 'Test tag'}
    
    assert Tag.count == 0, 'there must be no tag'
  end
  
  test 'it should create a tag if admin login' do
    UserSession.create(users(:ln))
    
    post :create, :tag => {:id => 1, :value => 'Test tag'}
    
    tag = Tag.last
    assert !tag.nil?, 'tag must exist'
    assert tag.value.eql?('Test tag'), 'value must be equal "Test tag"'
  end
  
  test 'it should destroy a tag if admin login' do
    UserSession.create(users(:ln))
    
    post :create, :tag => {:id => 1, :value => 'Test tag'}
    delete :destroy, :id => 1
    
    assert Tag.count == 0, 'there must be no tag'
  end

end
