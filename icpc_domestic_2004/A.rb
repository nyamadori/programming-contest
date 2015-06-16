# Hanafuda Shuffle

while true
  n, r = gets.split(' ').map(&:to_i)
  break if n == 0 && r == 0

  cards = (1..n).to_a.reverse

  r.times do
    p, c = gets.split(' ').map(&:to_i)

    taken = cards.slice!(p-1, c)
    cards.unshift(*taken)
  end

  puts cards.first
end