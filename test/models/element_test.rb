require 'minitest_helper'

# class ElementTest < ActiveSupport::TestCase
#   # test "the truth" do
#   #   assert true
#   # end
# end

describe Element do
  before do 
    @current_author = Author.first_or_create(email: 'test@mail.com', password: '12345678')
    @post = @current_author.posts.first_or_create(title: 'Sample Title', description: 'This is the sample description')
    @element = @post.elements.new
    @paragraph_element = @post.elements.find_or_create_by(element_type: 'paragraph')
    @image_element = @post.elements.find_or_create_by(element_type: 'image')
  end

  describe 'when creating new element without element_type' do
    it 'should fail' do
      _(@element.valid?).must_equal false
    end
  end
  describe 'when checking the element is paragraph' do
    it 'should return true' do
      _(@paragraph_element.paragraph?).must_equal true
    end
  end
  describe 'when checking the element is image' do
    it 'should return true' do
      _(@image_element.image?).must_equal true
    end
  end
end