require 'hmap'
require 'models/player'
require 'models/kill'

class Game
  attr_reader :players, :kills, :total_kills
  def initialize
    @players = {}
    @kills = []
    @total_kills = 0
  end

  def new_kill killer_name, killed_name, cause
    killed = get_player killed_name
    killed.deaths += 1

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

  def hash
    {
      total_kills: @total_kills,
      players: @players.keys,
      kills: @players.hmap do |name, stats|
        { name => stats.kills }
      end,
      kill_by_means: kill_by_means_hash
    }
  end

  private

  def get_player player_name
    @players[player_name] = Player.new unless @players.key?(player_name)
    @players[player_name]
  end

  def kill_by_means_hash
    kills_hash = {}
    @kills.map do |kill|
      total = kills_hash.key?(kill.cause) ? kills_hash[kill.cause] : 0
      kills_hash[kill.cause] = total + 1
    end
    kills_hash
  end
end