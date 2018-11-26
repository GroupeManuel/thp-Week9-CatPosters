require 'test_helper'

class ArtisanControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get artisan_new_url
    assert_response :success
  end

  test "should get create" do
    get artisan_create_url
    assert_response :success
  end

  test "should get show" do
    get artisan_show_url
    assert_response :success
  end

  test "should get index" do
    get artisan_index_url
    assert_response :success
  end

  test "should get edit" do
    get artisan_edit_url
    assert_response :success
  end

  test "should get update" do
    get artisan_update_url
    assert_response :success
  end

  test "should get destroy" do
    get artisan_destroy_url
    assert_response :success
  end

end
