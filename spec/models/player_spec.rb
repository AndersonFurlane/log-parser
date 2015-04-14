require 'spec_helper'

describe Player do
  before(:all) do
    @player = Player.new
  end

  it "name is #{ SupportPlayer.player }" do
    expect(@player.names).to eq([])
    @player.set_name(SupportPlayer.player_parse_name)
    expect(@player.names).to eq([SupportPlayer.player])
  end

  describe '#increment!' do
    it "#{ SupportPlayer.player } increment one kill" do
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(0))
      @player.increment!(SupportPlayer.player)
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(1))
    end

    it "#{ SupportPlayer.player } increment six kill" do
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(1))
      5.times{ @player.increment!(SupportPlayer.player) }
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(6))
    end
  end

  describe '#valid?' do
    it 'is valid' do
      expect(@player.valid?(SupportPlayer.line_valid)).to eq(true)
    end

    it 'is invalid' do
      expect(@player.valid?(SupportPlayer.line_invalid)).to eq(false)
    end
  end

  describe '#decrement!' do
    before(:all) do
      @player = Player.new
      @player.set_name(SupportPlayer.player_parse_name)
    end
    it "#{ SupportPlayer.player } decrement one kill, leaving zero kills" do
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(0))
      @player.increment!(SupportPlayer.player)
      @player.decrement!(SupportPlayer.player)
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(0))
    end

    it "#{ SupportPlayer.player } decrement one kill, leaving negative kills" do
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(0))
      @player.decrement!(SupportPlayer.player)
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(-1))
    end
  end
end