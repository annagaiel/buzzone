require 'test_helper'

class CommentsControllerTest < ActionController::TestCase

  test "create comment" do
  	user = FactoryGirl.create(:user)
    sign_in user
  	#  place_comments POST   /places/:place_id/comments(.:format) 
  	place = FactoryGirl.create(:place)

    assert_difference 'Comment.count' do
      post :create, :place_id => place.id, :comment => {
           		:message => 'Good place to go to',
          		:rating => '5_stars'
        	}
    end

    assert_redirected_to place_path(place)
    assert_equal 1, place.comments.count
  end

end

