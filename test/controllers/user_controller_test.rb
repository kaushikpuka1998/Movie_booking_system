require "test_helper"

class UserControllerTest < ActionDispatch::IntegrationTest
  test "should get create_user" do
    get user_create_user_url
    assert_response :success
  end
end
