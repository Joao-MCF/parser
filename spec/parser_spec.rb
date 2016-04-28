require 'spec_helper'

describe Parser do
  it 'has a version number' do
    expect(Parser::VERSION).not_to be nil
  end

  describe 'set game' do
    before :all do
      Parser.set_game
    end

    it 'defines games' do
      expect(Parser.games).not_to be_nil
    end

    it 'defines current_game' do
      expect(Parser.current_game).to be_nil
    end
  end

  describe 'reset status' do
    before :all do
      Parser.set_game
      Parser.reset_status
    end

    it 'resets games' do
      expect(Parser.games).to eq([])
    end

    it 'resets current_game' do
      expect(Parser.current_game).to be_nil
    end
  end

  describe 'process line' do
    context 'InitGame line' do
      before :all do
        line = "InitGame"
        Parser.process_line line
      end

      it 'sets the current_game' do
        expect(Parser.current_game).not_to be_nil
      end

      it 'increases games count' do
        expect(Parser.games.count).to eq(1)
      end
    end

    context 'Kill line' do
      before :all do
        line = "12:48 Kill: 3 2 6: Oootsimo killed Isgalamido by MOD_ROCKET"
        Parser.process_line line
      end

      it 'creates a new kill' do
        expect(Parser.current_game.kills.count).to eq(1)
      end
    end
  end

  describe 'Parse kill line' do
    context 'creates new kill' do
      before :all do
        Parser.set_game
        Parser.process_line "InitGame"
        line = "12:48 Kill: 3 2 6: Oootsimo killed Isgalamido by MOD_ROCKET"
        Parser.process_line line
      end

      it 'sets the killer' do
        expect(Parser.current_game.players["Oootsimo"].kills).to eq(1)
      end

      it 'sets the killed' do
        expect(Parser.current_game.players["Isgalamido"].deaths).to eq(1)
      end
    end
  end
end
