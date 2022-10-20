class Team
  attr_reader :mascot, :city, :roster, :long_term_players, :short_term_players,
              :details
  def initialize(mascot,city)
    @mascot = mascot
    @city = city
    @roster = []
    @long_term_players = []
    @short_term_players = []
    @details = {
      "total_value" => 0,
      "player_count" => 0
    }
  end

  def player_count
    details["player_count"]
  end

  def total_value
    details["total_value"]
  end

  def add_player(player)
    roster << player
    details["player_count"] += 1
      if player.contract_length > 24
        long_term_players << player
      else
        short_term_players << player
      end
    details["total_value"] += player.total_cost
  end
end