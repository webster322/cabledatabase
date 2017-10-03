require 'test_helper'

class CableControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cable_new_url
    assert_response :success
  end

  test "should get edit" do
    get cable_edit_url
    assert_response :success
  end

  test "should get view" do
    get cable_view_url
    assert_response :success
  end

  test "should get delete" do
    get cable_delete_url
    assert_response :success
  end

end
