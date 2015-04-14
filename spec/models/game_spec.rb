require 'spec_helper'

describe Game do
  before(:each) do
    @game = Game.new
  end

  it 'when increment method is call sum one' do
    expect(@game.count).to eq(0)
    @game.increment!
    expect(@game.count).to eq(1)
  end

  describe '#count' do
    it 'is zero to initialize' do
      expect(@game.count).to eq(0)
    end

    it 'count is six' do
      expect(@game.count).to eq(0)
      5.times{ @game.increment! }
      expect(@game.count).to eq(5)
    end
  end

  describe '#valid?' do
    it 'is valid when line have InitGame' do
      line_valid = '0:00 InitGame: \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0\sv_maxRate\10000'
      expect(@game.valid?(line_valid)).to eq(true)
    end

    it 'is invalid when line don`t have InitGame' do
      line_invalid = '0:00 : \sv_floodProtect\1\sv_maxPing\0\sv_minPing\0\sv_maxRate\10000'
      expect(@game.valid?(line_invalid)).to eq(false)
    end
  end
end