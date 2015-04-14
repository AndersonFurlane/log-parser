require 'spec_helper'

describe Kill do
  before(:all) do
    @kill = Kill.new
  end

  describe '#increment!' do
    it 'is count increment' do
      expect(@kill.count).to eq(0)
      @kill.increment!
      expect(@kill.count).to eq(1)
    end
  end

  describe '#count' do
    before(:all) do
      @kill = Kill.new
    end

    it 'count is zero when to initialize' do
      expect(@kill.count).to eq(0)
    end

    it 'count is six' do
      expect(@kill.count).to eq(0)
      5.times{ @kill.increment! }
      expect(@kill.count).to eq(5)
    end
  end

  describe '#valid?' do
    it 'line is valid' do
      line_valid = '21:42 Kill: 1022 2 22: <world> killed Isgalamido by'
      expect(@kill.valid?(line_valid)).to eq(true)
    end

    it 'line is invalid' do
      line_invalid = '21:42 : 1022 2 22: <world> killed Isgalamido by'
      expect(@kill.valid?(line_invalid)).to eq(false)
    end
  end

  describe '#account_kills' do
    before(:all) do
      @player = Player.new
      @player.set_name(SupportKill.player_parse_name)
    end

    it 'when player kill increment one kill' do
      @kill.account_kills(SupportKill.line_player_killer, @player)
      expect(@player.kills_by_player).to eq(SupportKill.kills(1))
    end

    it 'when world kill decrement one kill' do
      @kill.account_kills(SupportKill.line_world_killer, @player)
      expect(@player.kills_by_player).to eq(SupportKill.kills(0))
    end
  end
end