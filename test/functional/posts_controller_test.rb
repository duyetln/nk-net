require 'test_helper'
require 'authlogic/test_case'

class PostsControllerTest < ActionController::TestCase

  setup :activate_authlogic
  
  test 'it should not create a post if no login' do       
    post :create, :post => {:content => 'Test content'}
    
    assert Post.count == 0, 'there must be no post'
  end
  
  test 'it should create a post if login' do
    UserSession.create(users(:dn))
  
    post :create, :post => {:content => 'Test content'}
    
    post = Post.last
    assert !post.nil?, 'post must exist'
    assert post.content.eql?('Test content'), 'content must be equal "Test content"'
    assert post.user_id == users(:dn).id, 'post must be owned by logged in user'
  end
  
  test 'it should destroy a post if owner login' do
    UserSession.create(users(:dn))
    
    post :create, :post => {:id => 1, :content => 'Test content'}
    delete :destroy, :id => 1
    
    assert Post.count == 0, 'there must be no post'
  end
  
end
