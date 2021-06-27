class GamesController < ApplicationController
  require 'json'
  require 'httpclient'
  
  def index
    @result = Api::FootballData::Request.get_scheduled_games
    @matches = @result["matches"]
    @rates = Rate.get_rates.limit(5)
  end
  
  def show
    set_match(params[:id])
    @game = Game.find_or_create_by(id: params[:id])
  end
  
  def league
    @title = params[:title]
    set_league_matches(params[:code], params[:year], params[:day])
    set_standings(params[:code])
  end
  
  def cl
    @title = params[:title]
    set_tournament_matches(params[:code], params[:year], params[:stage], params[:day])
    set_tournament_standings(params[:code])
  end
  
  def euro
    @title = params[:title]
    set_tournament_matches(params[:code], params[:year], params[:stage], params[:day])
    set_tournament_standings(params[:code])
  end
    
  
  def scorers
    set_scorers(params[:code], params[:year])
  end
  
end