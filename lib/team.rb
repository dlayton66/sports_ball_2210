class Team
  attr_reader :mascot, :city, :roster, :long_term_players, :short_term_players,
              :lastnames, :details
  def initialize(mascot,city)
    @mascot = mascot
    @city = city
    @roster = []
    @long_term_players = []
    @short_term_players = []
    @lastnames = []
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
    lastnames << player.last_name
    details["player_count"] += 1
      if player.contract_length > 24
        long_term_players << player
      else
        short_term_players << player
      end
    details["total_value"] += player.total_cost
  end

  def average_cost_of_player
    cost = (details["total_value"]/details["player_count"]).to_s
    n = cost.length
    while n > 3 do
      n-=3
      cost.insert(n,",")
    end
    cost.insert(0,"$")
  end

  def players_by_last_name
    lastnames.sort.join(", ")
  end
end