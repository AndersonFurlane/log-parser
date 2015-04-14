class Player
  attr_reader :kill_by_player

  def initialize
    @kill_by_player = {}
  end

  def set_name(line)
    name = parse_name(line)
    @kill_by_player[name] = 0
  end

  def increment!(name)
    @kill_by_player[name] = @kill_by_player[name] + 1
  end

  def decrement!(name)
    @kill_by_player[name] = @kill_by_player[name] - 1
  end

  def names
    @kill_by_player.keys
  end

  def valid?(line)
    line.include?('ClientUserinfoChanged')
  end

  def kills_by_player
    @kill_by_player
  end

  private
  def parse_name(line)
    line.split('\\')[1]
  end
end