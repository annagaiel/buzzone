require 'test_helper'

class PlacesControllerTest < ActionController::TestCase
  test "places show page" do
	place = Place.create(:name => 'Gangnam Cafe', :address => '1035 Detroit Ave Ste 300 Concord, CA 94518', :description => 'Food taste homemade and the fresh squeezed orange juice is amazing!!')
	get :show, id => place.id
	assert_response :success
  end

  test "places show page, not found" do 
  	get :show, :id 'OMG'
  	assert_response :not_found
  end
end
