class Rank
  attr_reader :rank

  def initialize
    @rank = {}
  end

  def create(games)
    games.keys.each do |game|
      games[game]['kills'].each do |player|
        exist?(player[0]) ? sum_kills(player) : fist_kills(player)
      end
    end
    order_by_kills
  end

  private
  def exist?(player)
    @rank.has_key?(player)
  end

  def sum_kills(player)
    @rank[player[0]] += player[1]
  end

  def fist_kills(player)
    @rank[player[0]] = player[1]
  end

  def order_by_kills
    @rank.sort_by{ |k, v| v }.reverse.to_h
  end
end