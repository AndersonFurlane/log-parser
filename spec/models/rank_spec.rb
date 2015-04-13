require 'spec_helper'

describe Rank do
  before(:all) do
    list = []
    games = {}
    kills = {}
    @rank = Rank.new

    (1..3).to_a.each do |i|
      p 'i', i
      kills['kills'] = { "Test_#{ i }" => 1 }
      games["game_#{ i }"] = kills
    end
    @games = games
  end

  it 'x' do
    p @games
    ranking = @rank.create(@games)
    expect(ranking).to eq({ "Test_3"=>3, "Tes_2"=>2, "Test_1"=>1 })
  end
end