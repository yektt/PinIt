require 'test_helper'

class AccountControllerTest < ActionDispatch::IntegrationTest
  test "should get pins" do
    get account_pins_url
    assert_response :success
  end

end
