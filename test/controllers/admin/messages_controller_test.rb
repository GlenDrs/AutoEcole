require "test_helper"

class Admin::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_messages_new_url
    assert_response :success
  end

  test "should get show" do
    get admin_messages_show_url
    assert_response :success
  end

  test "should get create" do
    get admin_messages_create_url
    assert_response :success
  end
end
