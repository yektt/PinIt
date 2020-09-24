require 'test_helper'

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_new_url
    assert_response :success
  end

  test "should get log_in" do
    get user_log_in_url
    assert_response :success
  end

end
