class Parse
  def initialize
    @DASH = '------------------------------------------------------------'
    @reports = { }
    @games = Game.new
    @rank = Rank.new
  end

  def run!(log)
    file = File.read(log)
    games = file.split(@DASH)
    games.each do |game|
      class_intance
      next unless @games.valid?(game)
      @games.increment!
      game.each_line do |line|
        @players.set_name(line) if @players.valid?(line)
        @kills.account_kills(line, @players) if @kills.valid?(line)
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

  def add_game
    @reports["game_#{ @games.count }"] =
      {
        'total_kills' => @kills.count,
        'players' => @players.names,
        'kills' => @players.kills_by_player
      }
  end
end