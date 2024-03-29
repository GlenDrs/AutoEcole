require "test_helper"

class Admin::RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_rooms_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_rooms_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_rooms_destroy_url
    assert_response :success
  end
end
