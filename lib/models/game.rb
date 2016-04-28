require 'hmap'
require 'models/player'
require 'models/kill'

=begin
  GAME CLASS:
  Holds the information related to a game.

  Created by: Marcle Rodrigues
  Created at: April 28,2016

=end

class Game
  attr_reader :players, :kills, :total_kills
  def initialize
    @players = {}
    @kills = []
    @total_kills = 0
  end
  #Assign a new kill
  def new_kill killer_name, killed_name, cause
    killed = get_player killed_name
    killed.deaths += 1
    #If killer is world decrease player killed number of kills.
    if killer_name.eql?('<world>')
      killed.kills -= 1 if killed.kills > 0
    else
      killer = get_player killer_name
      killer.kills += 1
      kill = Kill.new killer, killed, cause
      @kills.push(kill)
    end
    @total_kills += 1
  end
  #Returns a hash with the basic params of the game
  def hash
    {
      total_kills: @total_kills,
      players: @players.keys,
      # Use hmap to iterate through the hash and return a new hash
      kills: @players.hmap do |name, stats|
        { name => stats.kills }
      end,
      kill_by_means: kill_by_means_hash
    }
  end

  private
  #If player exists return it else returns a new player
  def get_player player_name
    @players[player_name] = Player.new unless @players.key?(player_name)
    @players[player_name]
  end
  #Group kills by mean an return a hash
  def kill_by_means_hash
    kills_hash = {}
    @kills.map do |kill|
      total = kills_hash.key?(kill.cause) ? kills_hash[kill.cause] : 0
      kills_hash[kill.cause] = total + 1
    end
    kills_hash
  end
end