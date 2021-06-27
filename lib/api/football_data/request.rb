module Api
  module FootballData
    class Request

      def initialize
        code = code
        id = id
      end
      
      def self.get_scheduled_games
        url = "https://api.football-data.org/v2/competitions/EC/matches?stage=LAST_16"
        header = { 'X-Auth-Token': ENV['FOOTBALL_DATA_API_KEY'] }
        client = HTTPClient.new
        response = client.get(url, header: header)
        JSON.parse(response.body)
      end
  
      def self.get_league_games(code, year, day)
        url = "https://api.football-data.org/v2/competitions/#{code}/matches?season=#{year}&matchday=#{day}"
        header = { 'X-Auth-Token': ENV['FOOTBALL_DATA_API_KEY'] }
        client = HTTPClient.new
        response = client.get(url, header: header)
        JSON.parse(response.body)
      end
      
      def self.get_tournament_games(code, year, stage, day)
        url = "https://api.football-data.org/v2/competitions/#{code}/matches?season=#{year}&stage=#{stage}&matchday=#{day}"
        header = { 'X-Auth-Token': ENV['FOOTBALL_DATA_API_KEY'] }
        client = HTTPClient.new
        response = client.get(url, header: header)
        JSON.parse(response.body)
      end
      
      def self.show_game(id)
        url = "https://api.football-data.org/v2/matches/#{id}"
        header = { 'X-Auth-Token': ENV['FOOTBALL_DATA_API_KEY'] } 
        client = HTTPClient.new
        response = client.get(url, header: header)
        JSON.parse(response.body)
      end
      
      def self.get_standings(code)
        url = "https://api.football-data.org/v2/competitions/#{code}/standings"
        header = { 'X-Auth-Token': ENV['FOOTBALL_DATA_API_KEY'] } 
        client = HTTPClient.new
        response = client.get(url, header: header)
        JSON.parse(response.body)
      end
      
      def self.get_scorers(code, year)
        url = "https://api.football-data.org/v2/competitions/#{code}/scorers?season=#{year}"
        header = { 'X-Auth-Token': ENV['FOOTBALL_DATA_API_KEY'] } 
        client = HTTPClient.new
        response = client.get(url, header: header)
        JSON.parse(response.body)
      end
      
      def self.get_teams
          url = "https://api.football-data.org/v2/teams?areas=2114,2088,2081,2224,2072"
          header = { 'X-Auth-Token': ENV['FOOTBALL_DATA_API_KEY'] } 
          client = HTTPClient.new
          response = client.get(url, header: header)
          JSON.parse(response.body)
      end
      
      def self.get_team(id)
        url = "https://api.football-data.org/v2/teams/#{id}"
        header = { 'X-Auth-Token': ENV['FOOTBALL_DATA_API_KEY'] } 
        client = HTTPClient.new
        response = client.get(url, header: header)
        JSON.parse(response.body)
      end
      
      def self.get_team_matches(id)
        url = "https://api.football-data.org/v2/teams/#{id}/matches?limit=5"
        header = { 'X-Auth-Token': ENV['FOOTBALL_DATA_API_KEY'] } 
        client = HTTPClient.new
        response = client.get(url, header: header)
        JSON.parse(response.body)
      end
      
      

    end
  end
end