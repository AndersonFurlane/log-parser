class Game
  attr_reader :game_count

  def initialize
    @game_count = 0
  end

  def increment!
    @game_count += 1
  end

  def count
    @game_count
  end

  def valid?(game)
    game.include?('InitGame')
  end
end