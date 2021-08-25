class GamesController < ApplicationController
  require 'json'
  require 'httpclient'
  
  def index
    set_league_matches("PL", "", 3)
    @rates = Rate.get_rates.order(id: "DESC").limit(10)
    @rankings = Player.rankings
  end
  
  def show
    @game = Game.find_or_create_by(id: params[:id])
    set_match(@game.id)
    @comments = @game.comments.includes(:user)
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
    result = Api::FootballData::Request.get_scorers(params[:code], params[:year])
    @scorers = result["scorers"]
  end
  
end
