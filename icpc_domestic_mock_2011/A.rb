# Problem A: koukyoukoukokukikou

def get_hand(char)
  left_chars = %w(q w e r t a s d f g z x c v b)

  if left_chars.include?(char)
    'l'
  else
    'r'
  end
end

while true
  line = gets
  break unless line

  str = line.chomp
  break if str == '#'

  current = nil
  prev = nil
  count = -1

  str.each_char do |c|
    current = get_hand(c)

    if current != prev
      count += 1
    end

    prev = current
  end

  puts count
end