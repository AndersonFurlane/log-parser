require 'spec_helper'

describe Parse do
  before(:each) do
    @parse = Parse.new
  end

  describe 'method run!' do
    it 'world' do
      ranking = @parse.run!(SupportParse.log_kills_world)
      expect(ranking).to eq(SupportParse.log_kills_world_result)
    end

    it 'players' do
      ranking = @parse.run!(SupportParse.log_kills_players)
      expect(ranking).to eq(SupportParse.log_kills_players_result)
    end
  end
end