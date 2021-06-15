class RatesController < ApplicationController
    
  def index
    @rates = Rate.where(game_id: params[:game_id])
  end
  
  def show
    @rate = Rate.find(params[:id])
    @players = @rate.players.all
  end

end
