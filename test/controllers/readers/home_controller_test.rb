require 'minitest_helper'

class Readers::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_url
    assert_response :success
  end

end
