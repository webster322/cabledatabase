require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get locations_view_url
    assert_response :success
  end

  test "should get create" do
    get locations_create_url
    assert_response :success
  end

  test "should get delete" do
    get locations_delete_url
    assert_response :success
  end

end
