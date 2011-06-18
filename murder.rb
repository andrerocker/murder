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
    content "Trabalhei de forma autonoma por muitos anos no Kernel do linux junto com Linus Torvalds e Andrew Mortom que no dia a dia sao meus queridos amigos"
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
    divmode = body.length.to_f.divmod(width)
    lines = divmode[0]
    lines += 1 if divmode[1] > 0
    
    index = 0
    result = []

    lines.times {
      inicial = index==0 && 0 || (index+1 * width)
      final = inicial+width
      
      result << body[inicial..final]
      index += 1
    }

    result
  end
end

murder = Murder.new 
murder.draw