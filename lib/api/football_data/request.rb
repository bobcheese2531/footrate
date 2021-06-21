module Api
  module FootballData
    class Request

      def initialize
        code = code
        id = id
      end
  
      def self.get_games(code, year)
        url = "https://api.football-data.org/v2/competitions/#{code}/matches?season=#{year}"
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

    end
  end
end