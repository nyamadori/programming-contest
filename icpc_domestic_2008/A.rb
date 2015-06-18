# Problem A: 等しい合計点

require 'scanf'

def search_trade_card(taro, hanako)
  taro.each do |t|
    hanako.each do |h|
      taro_sum = taro.inject(:+) - t + h
      hanako_sum = hanako.inject(:+) - h + t

      return [t, h] if taro_sum == hanako_sum
    end
  end

  return [-1]
end

while true
  n, m = gets.scanf('%d %d')

  break if n == 0 && m == 0

  taro = []
  hanako = []

  n.times do
    taro << gets.to_i
  end

  m.times do
    hanako << gets.to_i
  end

  puts search_trade_card(taro, hanako).join(' ')
end