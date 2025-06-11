require "test_helper"

class RoshamboControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get roshambo_index_url
    assert_response :success
  end
end
