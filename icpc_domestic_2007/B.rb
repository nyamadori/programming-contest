# coding: utf-8
# Problem B: ログイン/ログアウト記録の解析
# http://judge.u-aizu.ac.jp/onlinejudge/description.jsp?id=1148&lang=jp

require 'scanf'

class User
  def initialize
    @current = {}
    @logs = []
  end
  
  def login(pc, time)
    return if @current
    @current = {:start => time, :pc => pc}
  end

  def logout(pc, time)
    return if @current[:pc] != pc
    @logs << {:start => @current[:start], :end => time}
    @current = {}
  end
end

def scanf(format)
  line = gets
  return line ? line.scanf(format) : []
end

while true
  N, M = scanf('%d %d')
  break if N == 0 && N == 0

  users = {}
  
  r = scanf('%d')
  r.times do
    t, n, m, s = scanf('%d %d %d %d')
    user = users[m] ||= User.new
    if s == 1
      user.login(n, t)
    else
      user.logout(n, t)
    end
  end

  q = scanf('%d')
  q.times do
    ts, te, m = scanf('%d %d %d')
  end
end
