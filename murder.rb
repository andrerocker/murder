class Murder
  def initialize
    @left_top = "."
    @right_top = "."

    @left = "'"
    @right = "'"

    @pipe = "|"

    @width = 80
  end

  def draw()
    inicial_line
    content "Desenvolvedor de Software - Locaweb IDC"
    content "De 19/02/2001 a 20/08/2004"
    empty_content
    content "Lorem Ipsum is simply dummy text of the printing and typesetting cascatinha1 Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including."

    normal_line
    puts ""
  end

  def full_line(left, right) 
    print left
    (@width-2).times { print "-" }
    print right
    print "\n"
  end

  def inicial_line
    full_line(@left_top, @right_top)
  end

  def normal_line
    full_line(@left, @right)
  end

  def content body
    width_available = @width - (2 + 3)
    
    if body.length<=width_available
      simple_content body
      return
    end
    
    generate_lines_by_width(body, width_available).each { |line| simple_content line }
  end

  def simple_content body
    print "#{@pipe} #{body} ".ljust(@width-1)+@pipe
    print "\n"
  end

  def empty_content
    simple_content ""
  end
  
  def generate_lines_by_width(body, width)
    navigator = resolve(body, width, 0)
    result = []
    
    while true
      result << body[navigator[:initial]..navigator[:final]]
      break if navigator[:final] == body.length
      navigator = resolve(body, width, navigator[:next])
    end
    
    result
  end
  
  def resolve(body, width, start)
    find_end = start+width
    
    if find_end < body.length
      if body[find_end] != " " && body[find_end+1] != " "
        find_end -= 1 while body[find_end] != " "
        find_end -= 1 while body[find_end] == " "
      end
    else
      find_end = body.length
    end
    
    start += 1 while body[start] == " " # start line with a word
    
    {initial: start, next: find_end+1 ,final: find_end}
  end
end

murder = Murder.new 
murder.draw