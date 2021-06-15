class GamesController < ApplicationController
  require 'json'
  require 'httpclient'
  
  # GET /games
  def index
  end

  # GET /games/1 
  def show
    id = params["id"]
    result= Api::FootballData::Request.show_game(id)
    @match = result["match"]
    @game = Game.find_or_create_by(id: id)
  end
  
  def pl
    set_matches("PL")
  end
  
  def cl
    set_matches("CL")
  end

  def liga
    set_matches("PD")
  end
  
  def euro
    set_matches("EC")
  end
  
  private
  def set_matches(code)
    result = Api::FootballData::Request.get_games(code)
    @matches = result["matches"]
  end
  
end