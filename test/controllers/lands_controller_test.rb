require "test_helper"

class LandsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lands_index_url
    assert_response :success
  end
end
