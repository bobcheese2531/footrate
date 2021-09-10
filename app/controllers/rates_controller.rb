class RatesController < ApplicationController
  before_action :authenticate_user!, except: %i(index show best_XI)
  
  def index
    @rates = Rate.get_rates.paginate(params[:page], 9).search(params[:search])
  end
  
  def show
    @rate = Rate.find(params[:id])
    set_match(@rate.game_id)
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
  
  def best_XI
    player = Player.group_best
    @gk = player.best("Goalkeeper", 1)
    @df = player.best("Defender", 4)
    @mf = player.best("Midfielder", 3)
    @fw = player.best("Attacker", 3)
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
      team['lineup'] << { "name" => s['playerIn']['name'], 
                          "position" => sub_position(team['bench'], s['playerIn']['name']), 
                          "shirtNumber" => sub_number(team['bench'], s['playerIn']['name']) }
    end
    team['lineup']
  end
  
  def sub_position(bench, player)
    bench.select { |b| b['name'] == (player) }[0]['position']
  end
  
  def sub_number(bench, player)
    bench.select { |b| b['name'] == (player) }[0]['shirtNumber']
  end

end
