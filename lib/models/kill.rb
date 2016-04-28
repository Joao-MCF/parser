=begin
  KILL CLASS:
  Holds information about kills.

  Created by: Marcle Rodrigues
  Created at: April 28,2016

=end
class Kill
  attr_accessor :killer, :killed, :cause
  def initialize killer, killed, cause
    @killer = killer
    @killed = killed
    @cause = cause
  end
end