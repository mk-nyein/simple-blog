require 'minitest_helper'

class PostTest < ActiveSupport::TestCase
  setup do 
    @current_author = authors(:one)
  end

  test "should fail to creat without title" do
    post_params = {title: '', description: 'This is the descripiton'}
    @post = @current_author.posts.new(post_params)
    assert_not @post.save
  end

  test "should fail to create without description" do
    post_params = {title: 'This is the title', description: ''}
    @post = @current_author.posts.new(post_params)
    assert_not @post.save
  end

  test "should fail to create with title and description less than 25 chars" do
    post_params = {title: 'This is the title', description: 'This is the descripiton'}
    @post = @current_author.posts.new(post_params)
    assert_not @post.save
  end

  test "should pass to create with title and description" do
    post_params = {title: 'This is the title', description: 'This is the long descripiton for the post.'}
    @post = @current_author.posts.new(post_params)
    assert @post.save
  end

  test "should return published posts" do
    @posts = Post.published
    @first_post = @posts.first
    assert_equal true, @first_post.published
  end
end
