class Parse
  @games_count = 0

  class << self
    def run!()
      file = File.open(Rails.public_path.join('games.log'))
      file.each do |line|
        game_count(line)
      end
      @games_count.times{ |i| puts "games_#{ i }" }
    end

    private
    def game_count(line)
      @games_count = (@games_count + 1) if line.include?('InitGame')
    end
  end
end