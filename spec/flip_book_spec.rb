require 'spec_helper'
require 'flip_book'

describe FlipBook do
  before do
    content = "road! brick yellow the Follow"
    @book = FlipBook.new(content)
  end

  it "has a flip method" do
    @book.flip.must_equal "Follow the yellow brick road!"
  end
end
