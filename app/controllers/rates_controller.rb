class RatesController < ApplicationController
  before_action :authenticate_user!, except: %i(index, show)
  
  def index
    @rates = Rate.get_rates.paginate(params[:page], 10).search(params[:search])
  end
  
  def show
    @rate = Rate.find(params[:id])
  end
  
  def new 
    set_match(params[:game_id])
    @home = set_members(@match['homeTeam'])
    @away = set_members(@match['awayTeam'])
    @rate = RateForm.new
  end
  
  def create
    @rate = RateForm.new
    @rate.assign_attributes(rate_form_params)
    if @rate.save
      redirect_to rates_path
    else
      redirect_to new_rate_path(game_id: @rate.game_id)
    end
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
  
  def rate_form_params
    params.require(:rate_form).permit(:home_team, :away_team, :game_id,
    players_attributes: [:name, :player_rate, :rate_text, :position, :shirtnumber, :team_id])
    .merge(user_id: current_user.id)
  end
  
  def set_members(team)
    sub = @match['substitutions'].select {|s| s['team']['name'] == team['name'] } 
    sub.each do |s|
      team['lineup'] << { "name" => s["playerIn"]["name"], "position" => "SUB", "shirtNumber" => 0 }
    end
    team['lineup']
  end

end
