class Player
  attr_reader :kill_by_player

  def initialize
    @kill_by_player = {}
  end

  def increment!(name)
    @kill_by_player[name] = @kill_by_player[name].nil? ? 1 : increment_kill!(name)
  end

  def get_names
    @kill_by_player.keys
  end

  def valid?(line)
    line.include?('ClientUserinfoChanged')
  end

  private
  def increment_kill!(name)
    @kill_by_player[name] = @kill_by_player[name] + 1
  end
end