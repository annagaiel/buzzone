require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "human format" do
  	comment = Comment.new(:rating => '5_stars')
  	assert_equal("five stars", comment.humanized_rating)
  end
end
