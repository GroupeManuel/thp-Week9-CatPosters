require 'test_helper'

class ArtisansControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get artisans_edit_url
    assert_response :success
  end

  test "should get update" do
    get artisans_update_url
    assert_response :success
  end

  test "should get create" do
    get artisans_create_url
    assert_response :success
  end

end
