require 'spec_helper'

describe Player do
  before(:all) do
    @player = Player.new
  end

  it 'set_name' do
    expect(@player.names).to eq([])
    @player.set_name(SupportPlayer.player_parse_name)
    expect(@player.names).to eq([SupportPlayer.player])
  end

  it 'names' do
    expect(@player.names).to eq([SupportPlayer.player])
  end

  it 'increment!' do
    expect(@player.kills_by_player).to eq(SupportPlayer.kills(0))
    @player.increment!(SupportPlayer.player)
    expect(@player.kills_by_player).to eq(SupportPlayer.kills(1))
  end

  describe 'method valid?' do
    it 'valid' do
      expect(@player.valid?(SupportPlayer.line_valid)).to eq(true)
    end

    it 'invalid' do
      expect(@player.valid?(SupportPlayer.line_invalid)).to eq(false)
    end
  end

  it 'kills_by_player' do
    expect(@player.kills_by_player).to eq(SupportPlayer.kills(1))
    5.times{ @player.increment!(SupportPlayer.player) }
    expect(@player.kills_by_player).to eq(SupportPlayer.kills(6))
  end

  describe 'method decrement!' do
    before(:all) do
      @player = Player.new
      @player.set_name(SupportPlayer.player_parse_name)
    end
    it 'decrement! values positive' do
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(0))
      @player.increment!(SupportPlayer.player)
      @player.decrement!(SupportPlayer.player)
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(0))
    end

    it 'decrement! values negative' do
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(0))
      @player.decrement!(SupportPlayer.player)
      expect(@player.kills_by_player).to eq(SupportPlayer.kills(-1))
    end
  end
end