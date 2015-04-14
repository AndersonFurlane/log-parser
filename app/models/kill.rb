class Kill
  attr_reader :kill_count

  def initialize
    @kill_count = 0
    @WORLD_KILLER = '<world>'
  end

  def increment!
    @kill_count += 1
  end

  def count
    @kill_count
  end

  def valid?(line)
    line.include?('Kill:')
  end

  def parse_killed(line)
    killed = line.split('killed')[1]
    killed.split('by')[0].strip
  end

  def parse_killer(line)
    killer = line.split('killed')[0].strip
    killer.include?(@WORLD_KILLER) ? @WORLD_KILLER : killer.split(':')[3].strip
  end

  def account_kills(line, players)
    increment!
    killer = parse_killer(line)

    if killer == @WORLD_KILLER
      killed = parse_killed(line)
      players.decrement!(killed)
    else
      players.increment!(killer)
    end
  end
end