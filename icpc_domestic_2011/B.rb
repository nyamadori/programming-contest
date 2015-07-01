# coding: utf-8
# Problem B: 世界の天秤

def pair?(a, b)
  if a == '(' &&  b == ')' || a == '[' && b == ']'
    true
  else
    false
  end
end

while true
  line = gets.chomp
  break if line == '.'

  stack = []
  
  line.each_char do |c|
    case c
    when '(', '['
      stack.push(c)
    when ')', ']'
      top = stack.pop

      unless pair?(top, c)
        stack.push('err')
        break
      end
    end
  end

  if stack.size == 0
    puts 'yes'
  else
    puts 'no'
  end
end
