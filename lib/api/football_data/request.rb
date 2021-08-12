module Api
  module FootballData
    class Request
      
      @url = "https://api.football-data.org/v2"
      
      def self.get_scheduled_games
        url = "#{@url}/competitions/PL/matches?matchday=1"
        fetch_data(url)
      end
  
      def self.get_league_games(code, year, day)
        url = "#{@url}/competitions/#{code}/matches?season=#{year}&matchday=#{day}"
        fetch_data(url)
      end
      
      def self.get_tournament_games(code, year, stage, day)
        url = "#{@url}/competitions/#{code}/matches?season=#{year}&stage=#{stage}&matchday=#{day}"
        fetch_data(url)
      end
      
      def self.show_game(id)
        url = "#{@url}/matches/#{id}"
        fetch_data(url)
      end
      
      def self.get_standings(code)
        url = "#{@url}/competitions/#{code}/standings"
        fetch_data(url)
      end
      
      def self.get_scorers(code, year)
        url = "#{@url}/competitions/#{code}/scorers?season=#{year}"
        fetch_data(url)
      end
      
      def self.get_teams
          url = "#{@url}/teams?areas=2114,2088,2081,2224,2072"
          fetch_data(url)
      end
      
      def self.get_team_matches(id)
        url = "#{@url}/teams/#{id}/matches?limit=5"
        fetch_data(url)
      end
      
      private
      def self.fetch_data(url)
        @header = { 'X-Auth-Token': ENV['FOOTBALL_DATA_API_KEY'] }
        @client = HTTPClient.new
        response = @client.get(url, header: @header)
        JSON.parse(response.body)
      end

    end
  end
end