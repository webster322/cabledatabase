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

  test "should get delete" do
    get fibres_delete_url
    assert_response :success
  end

end
