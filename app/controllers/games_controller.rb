class GamesController < ApplicationController
  require 'json'
  require 'httpclient'
  
  def index
    result = Api::FootballData::Request.get_scheduled_games
    @matches = result["matches"]
  end
  
  def show
    set_match(params[:id])
    @game = Game.find_or_create_by(id: params[:id])
  end
  
  def league
    @title = params[:title]
    set_matches(params[:code], params[:year], params[:day])
    set_standings(params[:code])
  end
  
  def tournament
    @title = params[:title]
    set_matches(params[:code], params[:year])
  end  
  
  def scorers
    set_scorers(params[:code], params[:year])
  end
  
end