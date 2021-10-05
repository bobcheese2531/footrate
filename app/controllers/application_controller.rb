class ApplicationController < ActionController::Base
  
  #devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_matchday
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :like_team])
  end
  
  def set_league_matches(code, year, day)
    result = Api::FootballData::Request.get_league_games(code, year, day)
    @matches = result['matches']
  end
  
  def set_tournament_matches(code, year, stage, day)
    result = Api::FootballData::Request.get_tournament_games(code, year, stage, day)
    @matches = result['matches']
  end
  
  def set_match(id)
    result = Api::FootballData::Request.show_game(id)
    @match = result['match']
  end
  
  def set_standings(code)
    result = Api::FootballData::Request.get_standings(code)
    @standings = result['standings'][0]['table']
  end
  
  def set_tournament_standings(code)
    result = Api::FootballData::Request.get_standings(code)
    @standings = result['standings']
  end
  
  def set_matchday
    @matchday = 7
  end
  
end
