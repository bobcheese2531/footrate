class RatesController < ApplicationController
    
  def index
    @rates = Rate.get_rates.paginate(params[:page], 12).search(params[:search])
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
