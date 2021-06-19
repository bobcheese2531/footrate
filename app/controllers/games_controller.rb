class GamesController < ApplicationController
  require 'json'
  require 'httpclient'
  
  def index
  end

  def pl
    set_matches("PL", params[:year])
  end

  def liga
    set_matches("PD", params[:year])
  end
  
  def bundes
    set_matches("BL1", params[:year])
  end
  
  def seriea
    set_matches("SA", params[:year])
  end
  
  def ligue
    set_matches("FL1", params[:year])
  end
  
  def cl
    set_matches("CL", params[:year])
  end  
  
  def euro
    set_matches("EC", params[:year])
  end
  
  def show
    set_match(params[:id])
    @game = Game.find_or_create_by(id: params[:id])
  end
  
  
end