# Red and Black
require 'scanf'

def get_player_pos(map)
  x = 0
  y = 0

  map.each_with_index do |row, yy|
    x = row.index('@')
    y = yy
    break if x
  end

  [x, y]
end

def walk(map, x, y)
  map[y][x] = 'x'

  walk(map, x, y + 1) if map[y + 1][x] == '.'
  walk(map, x, y - 1) if map[y - 1][x] == '.'
  walk(map, x + 1, y) if map[y][x + 1] == '.'
  walk(map, x - 1, y) if map[y][x - 1] == '.'
end

def count_walked(map)
  w = 0

  map.each do |row|
    w += row.count('x')
  end

  w
end

while true
  w, h = gets.scanf('%d %d')

  break if w == 0 && h == 0

  wall = '#' * (w + 2)
  map = [wall]

  h.times do
    map << '#' + gets.chop + '#'
  end

  map << wall

  pos = get_player_pos(map)

  walk(map, *pos)
  puts count_walked(map)
end