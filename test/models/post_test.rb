require 'minitest_helper'

# class PostTest < ActiveSupport::TestCase
#   # test "the truth" do
#   #   assert true
#   # end
# end

describe Post do
  before do 
    @current_author = Author.first_or_create(email: 'test@mail.com', password: '12345678')
    @post = @current_author.posts.new
  end

  describe 'when creating new post without title' do
    it 'should fail' do
      @post.title = ''
      @post.description = "This is the descripiton"
      _(@post.valid?).must_equal false
    end
  end
  describe 'when creating new post without description' do
    it 'should fail' do
      @post.title = 'This is title'
      @post.description = ""
      _(@post.valid?).must_equal false
    end
  end
  describe 'when creating new post with title and description' do
    it 'should success' do
      @post.title = 'This is title'
      @post.description = "This is the descripiton"
      _(@post.save).must_equal true
    end
  end
end