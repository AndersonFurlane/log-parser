class SupportKill
  class << self
    def player
      'Isgalamido'
    end

    def player_parse_name
      '20:34 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\xian/'
    end

    def kills(value)
      { SupportKill.player => value }
    end

    def line_player_killer
      '20:54 Kill: 1022 2 22: Isgalamido killed Mocinha by'
    end

    def line_world_killer
      '20:54 Kill: 1022 2 22: <world> killed Isgalamido by'
    end
  end
end