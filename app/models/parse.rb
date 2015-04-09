class Parse

  def initialize
    @DASH = '------------------------------------------------------------'
    @games = Game.new
    @kills = Kill.new
    @players = Player.new
  end

  def run!
    file = File.read(Rails.public_path.join('games.log'))
    games = file.split(@DASH)
    #games
    games.each do |game|
      next unless @games.valid?(game)
      @games.increment!
      game.each_line do |line|
        add_user(line) if @players.valid?(line)
        add_kill(line) if @kills.valid?(line)
      end
    end
    show_console
  end

  private
  def parse_players(players_info)
    @players << players_info.split('\\')[1]
  end

  def add_user(line)
    puts 'add_user'
  end

  def add_kill(line)
    puts 'add_kill'
  end

  def show_console
    @games.count.times{ |i| puts "games_#{ i + 1 }" }
    puts "total_kills: #{ @kills.count }"
    puts "players: #{ @players.get_names }"
  end
end