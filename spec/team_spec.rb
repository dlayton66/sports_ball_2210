require 'rspec'
require './lib/player'
require './lib/team'

RSpec.describe Team do
  it 'exists' do
    team = Team.new("Dodgers", "Los Angeles")
    
    expect(team).to be_a Team
  end

  it 'starts with an empty roster' do
    team = Team.new("Dodgers", "Los Angeles")

    expect(team.roster).to eq []
  end

  describe '#player_count' do
    it 'returns the number of players in the roster array' do
      team = Team.new("Dodgers", "Los Angeles")

      expect(team.player_count).to eq 0

      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      team.add_player(player_1)
      team.add_player(player_2)

      expect(team.player_count).to eq 2
    end
  end

  describe '#add_player' do
    it 'adds a player to the roster array' do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      team.add_player(player_1)
      team.add_player(player_2)

      expect(team.roster).to eq [player_1, player_2]
    end
  end

  describe '#long_term_players' do
    it 'lists players with contracts > 2 years' do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)
      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.long_term_players).to eq [player_1,player_3]
    end
  end

  describe '#short_term_players' do
    it 'lists players with contracts <= 2 years' do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)
      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.short_term_players).to eq [player_2,player_4]
    end
  end

  describe '#total_cost' do
    it 'returns the total cost of all players' do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)
      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.total_value).to eq 85200000
    end
  end

  describe '#details' do
    it 'returns a hash with total_cost and player_count' do
      team = Team.new("Dodgers", "Los Angeles")
      player_1 = Player.new("Michael Palledorous" , 1000000, 36)
      player_2 = Player.new("Kenny DeNunez", 500000, 24)
      player_3 = Player.new("Alan McClennan", 750000, 48)
      player_4 = Player.new("Hamilton Porter", 100000, 12)
      team.add_player(player_1)
      team.add_player(player_2)
      team.add_player(player_3)
      team.add_player(player_4)

      expect(team.details).to eq {"total_value" => 85200000, "player_count" => 4}
    end
  end
end
