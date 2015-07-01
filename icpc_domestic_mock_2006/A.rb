# coding: utf-8
# Problem: A
# Misterious Gems

require 'scanf'

def scanf(format)
  line = gets
  if line
    line.scanf(format)
  else
    []
  end
end

class Robot
  attr_reader :map, :x, :y, :ngem

  def initialize(map, x, y)
    @map = map
    @x = x
    @y = y
    @ngem = 0
  end

  def go(dir, n)
    vx = 0
    vy = 0
    case dir
    when 'N'
      vy = 1
    when 'S'
      vy = -1
    when 'E'
      vx = 1
    when 'W'
      vx = -1
    end

    n.times do |i|
      @x += vx
      @y += vy

      if @map[@y][@x]
        @ngem += 1
        @map[@y][@x] = nil
      end
    end
  end  
end

while true
  n, = scanf('%d')
  break if n == 0

  map = Array.new(21) do |i|
    Array.new(21)
  end
  
  # 宝石の位置を記録
  n.times do
    x, y = scanf('%d %d')
    map[y][x] = true
  end
  
  m, = scanf('%d')
  robot = Robot.new(map, 10, 10)
  
  # 命令を記録
  m.times do
    dir, len = scanf('%c %d')
    robot.go(dir, len)
  end

  if robot.ngem == n
    puts 'Yes'
  else
    puts 'No'
  end
end