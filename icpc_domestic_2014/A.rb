# Problem A: 税率変更

require 'scanf'

def tax(p, x)
  (p * (100 + x) / 100.0).to_i
end

def untax(p, x)
  (p / ((100 + x) / 100.0)).to_i
end

while true
  line = gets
  break unless line
  x, y, s = line.split(' ').map(&:to_i)

  break if [x, y, s].all? {|n| n == 0 }
  s = untax(s, x) - 1
  #puts '税抜: ' + s.to_s

  max = 0
  (1..s-1).each do |i|
    total = tax(i, y) + tax(s - i, y)
    if max < total
      max = total
    end
  end

  puts max
end
