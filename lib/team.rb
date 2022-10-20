class Team
  attr_reader :mascot, :city, :roster
  def initialize(mascot,city)
    @mascot = mascot
    @city = city
    @roster = []
  end

  def player_count
    roster.count
  end

  def add_player(player)
    roster << player
  end
end