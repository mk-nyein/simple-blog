require 'minitest_helper'

class Authors::PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in(authors(:one))
    @post = posts(:one)
  end

  test "should get index" do
    get posts_url
    assert_response :success
  end

  test "should get new" do
    get new_post_url
    assert_response :success
  end

  test "should not create post without title" do
    post_params = {author_id: @post.author_id, title: "", description: "Test description for the post create test", published: @post.published, published_at: @post.published_at}
    assert_no_difference('Post.count') do
      post posts_url, params: { post: post_params }
    end
    assert_select 'h6', "New Post"
    assert_select 'li', "Title can't be blank"
  end

  test "should not create post without description" do
    post_params = {author_id: @post.author_id, title: "Test title", description: "", published: false, published_at: @post.published_at}
    assert_no_difference('Post.count') do
      post posts_url, params: { post: post_params }
    end
    assert_select 'h6', "New Post"
    assert_select 'li', "Description can't be blank"
  end

  test "should not create post with description chars less than 25" do
    post_params = {author_id: @post.author_id, title: "Test title", description: "Test description", published: @post.published, published_at: @post.published_at}
    assert_no_difference('Post.count') do
      post posts_url, params: { post: post_params }
    end
    assert_select 'h6', "New Post"
    assert_select 'li', "Description is too short (minimum is 25 characters)"
  end

  test "should create post" do
    post_params = {author_id: @post.author_id, title: "Test title", description: "Test description for the post create test", published: @post.published, published_at: @post.published_at}
    assert_difference('Post.count') do
      post posts_url, params: { post: post_params }
    end

    assert_redirected_to edit_post_url(Post.last)
  end

  test "should get edit" do
    post_params = {title: "Test title Updated", description: "Test description for the post create test"}
    get edit_post_url(@post), params: { post: post_params}
    assert_response :success
  end

  test "should update post" do
    patch post_url(@post), params: { post: { author_id: @post.author_id, description: @post.description, published: @post.published, published_at: @post.published_at, title: @post.title } }
    assert_redirected_to edit_post_url(@post)
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete post_url(@post)
    end

    assert_redirected_to posts_url
  end
end
