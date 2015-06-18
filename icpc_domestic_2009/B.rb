# Matsuzaki Number
# 参考: http://d.hatena.ne.jp/sndr/20120110/1326189971

require 'prime'
require 'scanf'

def prime?(v)
  Prime.prime?(v, Prime::EratosthenesGenerator.new)
end

def next_prime(n)
  while true
    n += 1
    return n if prime?(n)
  end
end

def matsuzaki(n, p)
  primes = []
  totals = []

  (n+1 .. Float::INFINITY).each do |i|
    if prime?(i)
      primes << i
    end 

    break if primes.size >= p
  end

  (0 ... p).each do |i|
    (i ... p).each do |j|
      totals << primes[i] + primes[j]
    end
  end

  totals.sort[p - 1]
end

while true
  line = gets
  break unless line

  n, p = line.scanf('%d %d')
  break if n == -1 && p == -1

  puts matsuzaki(n, p)
end