require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get locations_index_url
    assert_response :success
  end

  test "should get create" do
    get locations_new_url
    assert_response :success
  end

end
