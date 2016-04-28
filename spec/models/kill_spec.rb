require 'spec_helper'

describe Kill do
  before :all do
    @kill = Kill.new "Player1", "Player2", "MOD_RAILGUN"
  end
  it 'is a instance of Kill' do
    expect(@kill).to be_instance_of Kill
  end

  context 'assigns param' do
    it 'killer' do
      expect(@kill.killer).to eq("Player1")
    end
    it 'killed' do
      expect(@kill.killed).to eq("Player2")
    end
    it 'cause' do
      expect(@kill.cause).to eq("MOD_RAILGUN")
    end
  end
end