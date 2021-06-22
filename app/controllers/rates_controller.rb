class RatesController < ApplicationController
    
  def index
    @rates = Rate.where(game_id: params[:game_id])
  end
  
  def show
    @rate = Rate.find(params[:id])
    @players = @rate.players.all
  end
  
  def destroy
    rate = Rate.find(params[:id])
    rate.destroy if rate.user_id == current_user.id
    redirect_to root_path
  end

end
