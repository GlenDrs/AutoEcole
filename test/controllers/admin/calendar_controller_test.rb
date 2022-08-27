require "test_helper"

class Admin::CalendarControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_calendar_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_calendar_create_url
    assert_response :success
  end
end
