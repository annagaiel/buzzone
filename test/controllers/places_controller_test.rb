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

  test "index" do
    FactoryGirl.create(:place)
    get :index
    assert_response :success
  end
  
  test "new not signed in" do
    get :new
    assert_redirected_to new_user_session_path
  end

  test "new" do
    user = FactoryGirl.create(:user)
    sign_in user
    get :new
    assert_response :success
  end

  test "create not signed in" do
    assert_no_difference 'Place.count' do
      post :create, {:place => {
          :name => 'yolo',
          :address => '123 Street'
          :description => 'omg',
          :latitude => 42.3631519,
          :lng => -71.056098,
        }
      }
    end
    assert_redirected_to new_user_session_path
  end

  test "create" do
    user = FactoryGirl.create(:user)
    sign_in user

    assert_difference 'Place.count' do
      post :create, {:place => {
          :name => 'yolo',
          :address => '123 Street',
          :description => 'omg',
          :latitude => 42.3631519,
          :longitude => -71.056098,
        }
      }
    end
    assert_redirected_to places_path

    assert_equal 1, user.places.count
  end

  test "create invalid" do
    user = FactoryGirl.create(:user)
    sign_in user

    assert_no_difference 'Place.count' do
      post :create, {:place => {
          :name => '',
          :address => '123 Street',
          :description => '',
          :lat => nil,
          :longitude => nil
        }
      }
    end

    assert_response :unprocessable_entity
  end

end

