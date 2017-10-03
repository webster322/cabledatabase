require 'test_helper'

class WiresControllerTest < ActionDispatch::IntegrationTest
  test "should get delete" do
    get wires_delete_url
    assert_response :success
  end

  test "should get new" do
    get wires_new_url
    assert_response :success
  end

  test "should get edit" do
    get wires_edit_url
    assert_response :success
  end

  test "should get view" do
    get wires_view_url
    assert_response :success
  end

end
