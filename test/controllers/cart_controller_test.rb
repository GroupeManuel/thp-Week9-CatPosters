require 'test_helper'

class CartControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cart_create_url
    assert_response :success
  end

  test "should get show" do
    get cart_show_url
    assert_response :success
  end

  test "should get update" do
    get cart_update_url
    assert_response :success
  end

end
