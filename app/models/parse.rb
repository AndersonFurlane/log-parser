class Parse

  def initialize
    @DASH = '------------------------------------------------------------'
    @KILLER_WORLD = '<world>'
    @games = Game.new
    @kills = Kill.new
    @players = Player.new
  end

  def run!
    file = File.read(Rails.public_path.join('games.log'))
    games = file.split(@DASH)
    games.each do |game|
      next unless @games.valid?(game)
      @games.increment!
      game.each_line do |line|
        add_player(line) if @players.valid?(line)
        add_kill(line) if @kills.valid?(line)
      end
    end
    show_console
  end

  private
  def parse_name_player(line)
    line.split('\\')[1]
  end

  def parse_killed(line)
    killed = line.split('killed')[1]
    killed.split('by')[0].strip
  end

  def parse_killer(line)
    killer = line.split('killed')[0].strip
    killer.split(' ')[5]
  end

  def add_player(line)
    name = parse_name_player(line)
    @players.set_name(name)
  end

  def add_kill(line)
    @kills.increment!
    killer = parse_killer(line)

    if killer == @KILLER_WORLD
      killed = parse_killed(line)
      @players.decrement!(killed)
    else
      @players.increment!(killer)
    end
  end

  def show_console
    @games.count.times{ |i| puts "games_#{ i + 1 }" }
    puts "total_kills: #{ @kills.count }"
    puts "players: #{ @players.names }"
    puts @players.kills_by_player
    end
  end
end