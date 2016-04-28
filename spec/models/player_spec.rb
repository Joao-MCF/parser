require 'spec_helper'

describe Player do
  before :all do
    @player = Player.new
  end

  it 'is a instance of Player' do
    expect(@player).to be_instance_of Player
  end

  context 'instanciate player params' do
    it 'initialize deaths at 0' do
      expect(@player.deaths).to eq(0)
    end
    it 'initialize kills at 0' do
      expect(@player.kills).to eq(0)
    end
  end

  context 'change player attributes' do
    it 'add death' do
      @player.deaths += 1
      expect(@player.deaths).to eq(1)
    end
    it 'add kills' do
      @player.kills += 1
      expect(@player.kills).to eq(1)
    end
  end
end