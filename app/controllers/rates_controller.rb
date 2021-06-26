class RatesController < ApplicationController
    
  def index
    @rates = Rate.page(params[:page]).per(9)
  end
  
  def show
    @rate = Rate.find(params[:id])
    @players = @rate.players.all
  end
  
  def destroy
    rate = Rate.find(params[:id])
    rate.destroy if rate.user_id == current_user.id
    redirect_to controller: :rates, action: :index
  end

end
