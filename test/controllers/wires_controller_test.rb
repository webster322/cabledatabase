require 'test_helper'

class WiresControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get wires_new_url
    assert_response :success
  end

  test "should get view" do
    get wires_view_url
    assert_response :success
  end

end
