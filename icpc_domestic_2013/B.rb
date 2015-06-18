require 'scanf'
require 'pp'

# 投稿
class Submit
  attr_accessor :time, :judge

  def initialize(time, judge)
    @time = time
    @judge = judge
  end

  def ok?
    @judge == 0
  end
end

# 同じ問題に対する投稿をまとめる
class Problem < Array
  def penalty
    if ok?
      (self.size - 1) * 20
    else
      0
    end
  end

  def ok?
    last.ok?
  end

  def time
    if ok?
      last.time + penalty
    else
      0
    end
  end
end

# チーム
class Team
  attr_reader :problems, :id

  def initialize(id)
    @id = id
    @problems = {}
  end

  def submit(problem, submit)
    log = @problems[problem] ||= Problem.new
    log << submit
  end

  def n_solved
    @problems
      .select { |id, problem| problem.ok? }
      .count
  end

  def total_time
    @problems
      .map { |id, problem| problem.time }
      .inject(0, :+)
  end

  def <=>(other)
    c = other.n_solved <=> self.n_solved
    unless c == 0
      c
    else
      self.total_time <=> other.total_time
    end
  end
end

while true
  line = gets
  break unless line

  mm, tt, pp, r = line.scanf('%d %d %d %d')
  break if [mm, tt, pp, r].all?(&:zero?)

  teams = Array.new(tt) do |t|
    Team.new(t + 1)
  end
  
  r.times do
    line = gets
    break unless line

    m, t, p, j = line.scanf('%d %d %d %d')
    teams[t - 1].submit(p, Submit.new(m, j))
  end

  sorted_teams = teams.sort

  rank = 1
  ranks = []

  sorted_teams.each_with_index do |t, i|
    prev = i == 0 ? nil : sorted_teams[i - 1]

    if !prev.nil? && t.n_solved == prev.n_solved && t.total_time == prev.total_time
      ranks.last << t.id
    else
      ranks << [t.id]
    end
  end

  puts ranks.map{|sr| sr.sort.reverse.join('=')}.join(',')
end