require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  test "unique_address" do
    place  = FactoryGirl.create(:place, address: "123 Test Street")
    place2 = FactoryGirl.build(:place, address: "123 Test Street")
    place2.save

    assert_equal("has already been taken", place2.errors[:address][0])

  end
end
