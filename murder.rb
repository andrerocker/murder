class Murder
  def initialize
    @left_top = "."
    @right_top = "."
    @pipe = "|"

    @width = 80
  end

  def draw()
    full_line 
    puts ""
  end

  def full_line
    print @left_top
    (@width-2).times { print "-" }
    print @right_top
  end
end

murder = Murder.new 
murder.draw
