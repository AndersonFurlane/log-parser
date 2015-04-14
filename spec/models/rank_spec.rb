require 'spec_helper'

describe Rank do
  before(:all) do
    @rank = Rank.new
    @ranking = @rank.create(SupportRank.games_fake)
  end

  it 'ranking is equal result' do
    expect(@ranking).to eq(SupportRank.result)
  end

  describe '#exist?' do
    it 'is exist' do
      expect(@rank.exist?(SupportRank.player_exist)).to eq(true)
    end

    it "isn't exist" do
      expect(@rank.exist?(SupportRank.player_no_exist)).to eq(false)
    end
  end
end