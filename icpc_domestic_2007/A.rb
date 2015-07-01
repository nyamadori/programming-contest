#  ICPC 得点集計ソフトウェア

while true
  n = gets.to_i

  break if n == 0

  points = []

  n.times do
    points << gets.to_i
  end

  points.sort!
  points.shift
  points.pop

  ave = points.inject(:+) / points.size
  puts ave.ceil
end