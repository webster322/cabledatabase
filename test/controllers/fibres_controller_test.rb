require 'test_helper'

class FibresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fibres_index_url
    assert_response :success
  end

  test "should get new" do
    get fibres_new_url
    assert_response :success
  end

  test "should get edit" do
    get fibres_edit_url
    assert_response :redirect
  end

  test "should get search" do
    get fibres_search_url
    assert_response :redirect
  end

end
