require 'test_helper'

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dashboard_show_url
    assert_response :success
  end

  test "should get create" do
    get dashboard_create_url
    assert_response :success
  end

  test "should get destroy" do
    get dashboard_destroy_url
    assert_response :success
  end

end
