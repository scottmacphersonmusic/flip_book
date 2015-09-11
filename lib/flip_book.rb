class FlipBook
  def initialize(content)
    @content = content
  end

  def flip
    split.reverse.join " "
  end

  private

  def split
    c = @content.dup
    words = []
    words << slice_first_word!(c) while c.index " "
    words << c
  end

  def slice_first_word!(sentence)
    sentence.slice!(0..sentence.index(" ")).rstrip
  end
end
