require 'test_helper'

class Readers::PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    sign_in(authors(:one))
    @post_one = posts(:one)
  end

  test 'should show post page of given post_id' do
    get blog_post_url(id: @post_one.id)
    assert_response :ok
    assert_select  'h2', 'My String one'
  end

  test "should upvote by current_author" do
    skip
    inspect current_author
  end

  test "should downvote by current_author" do
    skip
  end
  
end
