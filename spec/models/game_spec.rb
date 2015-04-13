require 'spec_helper'

describe Game do
  before(:all) do
    @game = Game.new
  end

  it 'initialize' do
    expect(@game.count).to eq(0)
  end

  it 'increment!' do
    expect(@game.count).to eq(0)
    @game.increment!
    expect(@game.count).to eq(1)
  end

  it 'count' do
    expect(@game.count).to eq(1)
    5.times{ @game.increment! }
    expect(@game.count).to eq(6)
  end

  describe 'method valid' do
    it 'valid' do
      line_valid = '0:00 InitGame: \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0\sv_maxRate\10000'
      expect(@game.valid?(line_valid)).to eq(true)
    end

    it 'invalid' do
      line_invalid = '0:00 : \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0\sv_maxRate\10000'
      expect(@game.valid?(line_invalid)).to eq(false)
    end
  end
end