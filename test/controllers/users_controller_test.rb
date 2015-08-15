require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "users show page" do
	user = User.create(:email => 'buzzoneapp@gmail.com', :encrypted_password => '12fdsa12')
	get :show, id => user.id
	assert_response :success
  end

  test "users show page, not found" do 
  	get :show, :id 'OMG'
  	assert_response :not_found
  end
end
