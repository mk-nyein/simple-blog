require 'minitest_helper'

class Readers::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_url
    assert_response :success
  end

  test "should show the posts of the given username" do
    get home_posts_of_member_url(username: authors(:one).username)
    assert_response :ok
  end

  test "should show 404 not found for wrong username" do
    assert_raises(ActionController::RoutingError) do
      get home_posts_of_member_url(username: "")
    end
  end

end
