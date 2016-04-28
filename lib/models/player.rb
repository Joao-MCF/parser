=begin
  PLAYER CLASS:
  Holds information about players.

  Created by: Marcle Rodrigues
  Created at: April 28,2016

=end
class Player
  attr_accessor :deaths, :kills
  def initialize
    @deaths = 0
    @kills = 0
  end
end