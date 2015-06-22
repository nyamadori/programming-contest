# coding: utf-8
# Problem B: 連鎖消滅パズル
require 'scanf'

def find_chunks(board)
  chunks = []
  
  board.each_with_index do |row, i|
    prev = nil
    cnt = 1
    
    row.each_with_index do |p, j|
      if p == row[j + 1]
        cnt += 1
      else
        chunks << {
          :row => i,
          :start => j - cnt + 1,
          :end => j
        } if cnt >= 3
      end
    end
  end

  chunks
end

def eliminate(board, chunks)
  chunks.each do |chunk|
    row = board[chunk[:row]]
    row.fill(nil, chunk[:start]..chunk[:end])
  end
end

def fall_blocks(board, chunks)
  board.reverse_each.each_with_index do |row, i|
    row.each_with_index do |p, j|
      next unless p

      stop = nil

      (i+1 .. board.size-1).each do |k|
        under = board[k]
        break if under.nil?
        p = under[j]

        break if p
        stop = k
      end

      puts [i, j, stop, p].join(', ')
      
      if stop
        board[i][j] = nil
        board[stop][j] = p
      end
    end
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

  chunks = find_chunks(board)
  pp chunks
  eliminate(board, chunks)
  pp board
  fall_blocks(board, chunks)
  pp board
end
