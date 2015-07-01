# Problem A: 次期町長

require 'scanf'

def scanf(format)
  line = gets
  if line
    line.scanf(format)
  else
    []
  end
end

while true
  n, p = scanf('%d %d')
  break if n == 0 && p == 0

  bowl = p
  players = Array.new(n, 0)
  winner = nil

  while true
    finish = false

    players.each_with_index do |nstone, i|
      if bowl >= 1
        bowl -= 1
        players[i] += 1
      else
        players[i] = 0
        bowl += nstone
      end
      
      if bowl == 0 && players[i] == p
        winner = i
        finish = true
        break
      end
    end

    break if finish
  end

  puts winner
end