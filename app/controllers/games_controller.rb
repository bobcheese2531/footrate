class GamesController < ApplicationController
  require 'json'
  require 'httpclient'
  
  def index
  end

  def pl
    set_matches("PL", "")
  end

  def liga
    set_matches("PD", "")
  end
  
  def bundes
    set_matches("BL1", "")
  end
  
  def seriea
    set_matches("SA", "")
  end
  
  def ligue
    set_matches("FL1", "")
  end
  
  def cl
    set_matches("CL", "")
  end  
  
  def euro
    set_matches("EC", "")
  end
  
  def show
    set_match(params[:id])
    @game = Game.find_or_create_by(id: params[:id])
  end
  
  
end