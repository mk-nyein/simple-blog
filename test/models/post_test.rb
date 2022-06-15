require 'minitest_helper'

class PostTest < ActiveSupport::TestCase
  setup do 
    @current_author = Author.first_or_create(email: 'test@mail.com', password: '12345678')
    @post = @current_author.posts.new
  end

  test "post should fail to creat without title" do
    @post.title = ''
    @post.description = "This is the descripiton"
    assert_not @post.save
  end
  test "post should fail to create without description" do
    @post.title = 'This is the title'
    @post.description = ""
    assert_not @post.save
  end
  test "post should pass to create with title and description" do
    @post.title = 'This is the title'
    @post.description = "This is the descripiton"
    assert @post.save
  end
end
