class RatesController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  
  def index
    @rates = Rate.get_rates.paginate(params[:page], 10).search(params[:search])
  end
  
  def show
    @rate = Rate.find(params[:id])
    @players = @rate.players.all
  end
  
  def destroy
    rate = Rate.find(params[:id])
    if rate.user_id == current_user.id
      rate.destroy 
      redirect_to rates_path
    else
      redirect_to rate
    end
  end
  
  private
  def set_rate
    @rate = Rate.find(params[:id])
  end

end
