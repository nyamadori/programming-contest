# coding: utf-8
# Problem B: 連鎖消滅パズル
require 'scanf'

def find_chunks(board)
  chunks = []
  
  board.each_with_index do |row, i|
    start = nil
    cnt = 1

    row.each_with_index do |p, j|
      if p && p == row[j + 1]
        start ||= j
        cnt += 1
      else
        if cnt >= 3
          chunks << {point: row[start], row: i, start: start, cnt: cnt}
        end

        cnt = 1
        start = nil
        
      end
    end
  end

  chunks
end

def calc_points(chunks)
  chunks
    .map {|c| c[:point] * c[:cnt] }
    .inject(0, :+)
end

def eliminate(board, chunks)
  chunks.each do |chunk|
    row = board[chunk[:row]]
    row.fill(nil, chunk[:start], chunk[:cnt])
  end
end

def fall_blocks(board)
  while true
    cont = false

    (0..board.size - 1).reverse_each do |i|
      board[i].each_with_index do |p, j|
        break if i == 0
        ap = board[i - 1][j]

        if !p && ap
          #swap
          board[i][j] = ap
          board[i - 1][j] = p

          cont = true
        end
      end
    end

    return unless cont

  end
end

require 'pp'
while true
  h = gets.to_i
  break if h == 0
  board = []
  
  h.times do
    board << gets.scanf('%d %d %d %d %d')
  end

  points = 0

  while true
    chunks = find_chunks(board)
    break if chunks.size == 0

    points += calc_points(chunks)
    eliminate(board, chunks)
    fall_blocks(board)
  end

  puts points
end
