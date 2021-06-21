class GamesController < ApplicationController
  require 'json'
  require 'httpclient'
  
  def index
  end

  def league
    @title = params[:title]
    set_matches(params[:code], params[:year])
  end
  
  def cl
    set_matches("CL", params[:year])
  end  
  
  def euro
    set_matches("EC", params[:year])
  end
  
  def standings
    set_standings(params[:code])
  end
  
  def show
    set_match(params[:id])
    @game = Game.find_or_create_by(id: params[:id])
  end
  
  
end