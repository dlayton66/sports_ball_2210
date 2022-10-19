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

      expect(roster).to eq [player_1, player_2]
    end
  end
end
