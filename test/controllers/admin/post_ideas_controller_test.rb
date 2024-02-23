require "test_helper"

class Admin::PostIdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_post_ideas_show_url
    assert_response :success
  end
end
