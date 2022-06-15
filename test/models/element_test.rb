require 'minitest_helper'

class ElementTest < ActiveSupport::TestCase
  setup do
    @current_author = Author.first_or_create(email: 'test@gmail.com', password: '12345678')
    @post = @current_author.posts.first_or_create(title: 'Sample Title', description: 'This is the sample description')
    @element = @post.elements.new
  end
  test " should not create without post_id" do
    @element = Element.new
    assert_not @element.valid?
  end
  test " should not create without element_type" do
    @element = @post.elements.new
    assert_not @element.valid?
  end
  test " should not create if element_type is empty" do
    @element = @post.elements.new
    @element.element_type = ""
    assert_not @element.valid?
  end

end
