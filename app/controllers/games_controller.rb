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
    @home = result["match"]["homeTeam"]["lineup"]
    @away = result["match"]["awayTeam"]["lineup"]
    @game = Game.find_or_create_by(id: id)
  end
  
  def pl
    result = Api::FootballData::Request.get_games("PL")
    @matches = result["matches"]
  end
  
  def cl
    result = Api::FootballData::Request.get_games("CL")
    @matches = result["matches"]
  end

  def liga
    result = Api::FootballData::Request.get_games("PD")
    @matches = result["matches"]
  end
  
  def euro
    result = Api::FootballData::Request.get_games("EC")
    @matches = result["matches"]
  end
  
end