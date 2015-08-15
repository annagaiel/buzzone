require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  test "places show page" do
	place = FactoryGirl.create(:place)
	get :show, id => place.id
	assert_response :success
  end

  test "places show page, not found" do 
  	get :show, :id 'OMG'
  	assert_response :not_found
  end
end
