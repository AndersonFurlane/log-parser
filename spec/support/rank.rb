class SupportRank
  class << self
    def games_fake
      {'game_1'=>{ 'kills'=>{ 'Isgalamido'=>2, 'Dono da Bola'=>1 }}, 'game_2'=>{ 'kills'=>{'Isgalamido'=>2, 'Dono da Bola'=>1 }}}
    end

    def result
      { "Isgalamido"=>4, "Dono da Bola"=>2 }
    end

    def player_exist
      "Isgalamido"
    end

    def player_no_exist
      "Mocinha"
    end
  end
end