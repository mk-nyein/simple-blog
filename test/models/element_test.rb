require 'minitest_helper'

class ElementTest < ActiveSupport::TestCase
  setup do
    @current_author = authors(:one)
    @post = posts(:one)
  end

  test "should not create without post_id" do
    @element = Element.new
    assert_not @element.valid?
  end

  test "should not create without element_type" do
    @element = @post.elements.new()
    assert_not @element.valid?
  end
  
  test "should not create if element_type is empty" do
    element_params = {element_type: ""}
    @element = @post.elements.new(element_params)
    assert_not @element.valid?
  end

  test "should create for paragraph element" do
    element_params = {element_type: 'paragraph', content: "<div>It is an example paragraph </div>"}
    @element = @post.elements.new(element_params)
    assert @element.save
  end

  test "should create for image element" do
    element_params = {element_type: 'image' }
    @element = @post.elements.new(element_params)
    assert @element.save
  end

end
