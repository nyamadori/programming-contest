# Problem A: 次期町長

require 'scanf'

def check_hands(hands, pi)
  hands.each_with_index do |h, i|
    return false if h != 0 && i != pi
  end

  return true
end

while true
  n, p = gets.scanf('%d %d')

  break if n == 0 && p == 0

  hands = Array.new(n, 0)

  while true
    game_end = false
    winner = nil

    hands.each_with_index do |h, i|
      if p == 0
        p += hands[i]
        hands[i] = 0
      elsif p == 1 && check_hands(hands, h)
        game_end = true
        winner = h
        break
      else
        p -= 1
        hands[i] += 1
      end
    end

    if game_end
      puts winner
      break
    end
  end
end