require 'spec_helper'

describe Game do
  before :all do
    @game = Game.new
  end

  it 'is instance of Game' do
    expect(@game).to be_instance_of Game
  end

  it 'returns the game as a hash' do
    expect(@game.hash).to eq({:total_kills => 0, :players => [], :kills => {}, :kill_by_means => {}})
  end

  context 'instanciate game params' do
    it 'sets players hash' do
      expect(@game.players).to eq({})
    end
    it 'sets kills array' do
      expect(@game.kills).to eq([])
    end
    it 'sets total kills to 0' do
      expect(@game.total_kills).to eq(0)
    end
  end

  context 'new kill' do
    before :all do
      @game.new_kill "Player1", "Player2", "MOD_RAILSGUN"
    end

    it 'increases death to killed player' do
      expect(@game.players["Player2"].deaths).to eq(1)
    end

    it 'increases kill to killer player' do
      expect(@game.players["Player1"].kills).to eq(1)
    end

    it 'increase total kills count' do
      expect(@game.total_kills).to eq(1)
    end

    it 'decreases player kills count if killed by <world>' do
      @game.new_kill "<world>", "Player1", "MOD_RAILSGUN"
      expect(@game.players["Player1"].kills).to eq(0)
    end
  end

  context 'get player' do
    before :all do
      @game.send(:get_player, "New")
    end

    it 'assigns the new player' do
      expect(@game.players.include? "New").to eq(true)
    end

    it 'returns player if player exists' do
      expect{
        @game.send(:get_player, "New")
      }.not_to change(@game.players, :count)
    end
  end

  context 'kill by means hash' do
    it 'returns a ahsh with kills by mean' do
      @game.new_kill "Player1", "Player2", "MOD_RAILSGUN"
      expect(@game.hash[:kill_by_means]).to eq({"MOD_RAILSGUN" => 2})
    end
  end
end