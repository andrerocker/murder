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
    content "Sou uma linha curta"
    content "Trabalhei de forma autonoma por muitos anos no Kernel do linux junto com Linus Torvalds e Andrew Mortom que no dia a dia sao meus queridos amigos"
    content "Trabalhei de forma autonoma por muitos anos no Kernel do linux junto com Linus Torvalds e Andrew Mortom que no dia a dia sao meus queridos amigos"
    content "a a a s d f g h h h hhh ff gggg gg gggg gf ffff fff fff ffff rr eeeeee ww ee e er rrr e r rrrr e rrrr r r ee rr rrrrr rr rrr"
     content "a a a s d f g h h h hhh ff gggg gg gggg gf ffff fff fff ffff rr eeeeeesss se er rrr e r rrrr e rrrr r r ee rr rrrrr rr rrr"
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