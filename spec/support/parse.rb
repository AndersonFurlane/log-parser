class SupportParse
  class << self
    def log_kills_world
      Rails.root.join './spec/support/logs/world.log'
    end

    def log_kills_players
      Rails.root.join './spec/support/logs/players.log'
    end

    def log_kills_players_result
      {
        "ranking"=>{"Zeh"=>1, "Mocinha"=>1, "Dono da Bola"=>1, "Isgalamido"=>-1},
        "games"=>{
          "game_1"=>{
            "total_kills"=>4,
            "players"=>["Dono da Bola", "Mocinha", "Isgalamido", "Zeh"],
            "kills"=>{
              "Dono da Bola"=>1,
              "Mocinha"=>0,
              "Isgalamido"=>1,
              "Zeh"=>1}
          },
          "game_2"=>{
            "total_kills"=>3,
            "players"=>["Isgalamido", "Mocinha"],
            "kills"=>{"Isgalamido"=>-2, "Mocinha"=>1}
          }
        }
      }
    end

    def log_kills_world_result
      {
        'ranking'=>{ 'Mocinha'=>1, 'Isgalamido'=>-2 },
        'games'=>{
          'game_1'=>{
            'total_kills'=>3,
            'players'=>['Isgalamido', 'Mocinha'],
            'kills'=>{ 'Isgalamido'=>-2, 'Mocinha'=>1 }
          }
        }
      }
    end
  end
end