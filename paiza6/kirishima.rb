def can_clear?(cells, n)
  index = 0
  visited = [true]
  vec = n

  loop do
    index += vec
    break if index < 0
    return true if index == cells.size - 1

    vec = cells[index]
    break if !vec || visited[index]

    visited[index] = true
  end

  false
end

gets # 読み飛ばす

cells = gets.split.map(&:to_i)
m = gets.to_i

m.times do
  n = gets.to_i

  if can_clear?(cells, n)
    puts 'Yes'
  else
    puts 'No'
  end
end
