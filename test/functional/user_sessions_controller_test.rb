require 'test_helper'
require 'authlogic/test_case'

class UserSessionsControllerTest < ActionController::TestCase
  
  setup :activate_authlogic
  
  test 'it should sign a user in on create' do
    post :create, :user_session => { :email => 'def@domain.com', :password => '123456'}
    
    assert UserSession.find.user.email.eql?('def@domain.com'), 'email must be equal "def@domain.com"'
  end
  
  test 'it should sign a user out on destroy' do
    UserSession.create(users(:ln))
    
    delete :destroy
    
    assert UserSession.find.nil?, 'there must be no session'
  end
end
