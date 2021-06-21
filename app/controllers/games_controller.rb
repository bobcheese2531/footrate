class GamesController < ApplicationController
  require 'json'
  require 'httpclient'
  
  def index
  end
  
  def show
    set_match(params[:id])
    @game = Game.find_or_create_by(id: params[:id])
  end
  
  def league
    @title = params[:title]
    set_matches(params[:code], params[:year])
  end
  
  def tournament
    @title = params[:title]
    set_matches(params[:code], params[:year])
  end  
  
  def standings
    set_standings(params[:code])
  end
  
  def scorers
    set_scorers(params[:code], params[:year])
  end
  
end