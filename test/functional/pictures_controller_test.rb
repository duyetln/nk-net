require 'test_helper'
require 'authlogic/test_case'

class PicturesControllerTest < ActionController::TestCase

  setup :activate_authlogic
  
  test 'it should not create a picture if no login' do
    picture = fixture_file_upload 'SWAT.jpg'
  
    post :create, :picture => {:id => 1, :data => picture}
  
    assert Picture.count == 0, 'there must be no picture'
  end
  
  test 'it should create a picture if login' do
    UserSession.create(users(:dn)) 
    picture = fixture_file_upload 'SWAT.jpg'
    
    post :create, :picture => {:id => 1, :data => picture}
    
    picture = Picture.last
    assert !picture.nil?, 'picture must exist'
    assert picture.user_id == users(:dn).id, 'picture must be owned by logged in user'
  end
  
  test 'it should delete a picture if owner login' do
    UserSession.create(users(:dn))
    picture = fixture_file_upload 'SWAT.jpg'
    
    post :create, :picture => {:id => 1, :data => picture}
    delete :destroy, :id => 1
    
    assert Picture.count == 0, 'there must be no picture'
  end
  
  
end
