require "parser/version"
require "modules/rules"
require "models/game"

module Parser
  def self.set_game
    @games = []
    @current_game = nil
  end

  def self.parse logfile
    log = File.new logfile
    reset_status
    while line == log.gets
      process_line line
    end

  rescue  => error
    puts "Parse failed while reading the log file. Error: #{error}"
    raise error
  end

  def self.reset_status
    @games.clear
    @current_game = nil
  end

  def self.version
    Parser::Version
  end

  def self.games
    @games
  end

  def self.current_game
    @current_game
  end

  def self.process_line line
    if line =~ Rules.init_game
      @current_game = Game.new
      @games.push(@current_game)
    elsif line =~ Rules.kill
      parse_kill_line line
    end
  end

  def self.parse_kill_line line
    kill_line = line.split(':').last
    kill_data = kill_line.split(Rules.kill_split)
    killer = kill_data[0].strip
    killed = kill_data[1].strip
    cause = kill_data[2].strip
    @current_game.new_kill killer, killed, cause
  end

end