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

    n.times do
      @ngem += 1 if @map[@y][@x]
      @x += vx
      @y += vy
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

  puts map.map{|r| r.map{|c| c ? 'X' : '_' }.join('')}.join("\n")
  
  m, = scanf('%d')
  robot = Robot.new(map, 10, 10)
  
  # 命令を記録
  m.times do
    dir, n = scanf('%c %d')
    robot.go(dir, n)
  end

  if robot.ngem == n
    puts 'yes'
  else
    puts 'no'
  end
end
