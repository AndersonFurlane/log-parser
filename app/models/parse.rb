class Parse
  def initialize
    @DASH = '------------------------------------------------------------'
    @WORLD_KILLER = '<world>'
    @reports = { }
    @games = Game.new
    @rank = Rank.new
  end

  def run!
    file = File.read(Rails.public_path.join('games.log'))
    games = file.split(@DASH)
    games.each do |game|
      class_intance
      next unless @games.valid?(game)
      @games.increment!
      game.each_line do |line|
        add_player(line) if @players.valid?(line)
        add_kill(line) if @kills.valid?(line)
      end
      add_game
    end
    report
  end

  private

  def report
    {
      'ranking' => @rank.create(@reports),
      'games' => @reports
    }
  end

  def class_intance
    @kills = Kill.new
    @players = Player.new
  end

  def parse_name_player(line)
    line.split('\\')[1]
  end

  def parse_killed(line)
    killed = line.split('killed')[1]
    killed.split('by')[0].strip
  end

  def parse_killer(line)
    killer = line.split('killed')[0].strip
    killer.include?(@WORLD_KILLER) ? @WORLD_KILLER : killer.split(':')[3].strip
  end

  def add_player(line)
    name = parse_name_player(line)
    @players.set_name(name)
  end

  def add_kill(line)
    @kills.increment!
    killer = parse_killer(line)

    if killer == @WORLD_KILLER
      killed = parse_killed(line)
      @players.decrement!(killed)
    else
      @players.increment!(killer)
    end
  end

  def add_game
    @reports["game_#{ @games.count }"] =
      {
        'total_kills' => @kills.count,
        'players' => @players.names,
        'kills' => @players.kills_by_player
      }
  end
end