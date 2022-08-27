require "test_helper"

class Admin::TimeslotsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_timeslots_new_url
    assert_response :success
  end

  test "should get create" do
    get admin_timeslots_create_url
    assert_response :success
  end

  test "should get destroy" do
    get admin_timeslots_destroy_url
    assert_response :success
  end
end
