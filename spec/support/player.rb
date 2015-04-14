class SupportPlayer
  class << self
    def player
      'Isgalamido'
    end

    def player_parse_name
      '20:34 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\xian/'
    end

    def kills(value)
      { SupportPlayer.player => value }
    end

    def line_valid
      '20:34 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\xian/default\hmodel\xian/'
    end

    def line_invalid
      '20:34 : 2 n\Isgalamido\t\0\model\xian/default\hmodel\xian/'
    end
  end
end