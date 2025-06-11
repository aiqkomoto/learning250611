require "test_helper"

class CountUpControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get count_up_index_url
    assert_response :success
  end
end
