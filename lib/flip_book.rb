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
    while c.index " "
      i = c.index " "
      words << c.slice!(0..(i - 1))
      c.lstrip!
    end
    words << c
  end
end
