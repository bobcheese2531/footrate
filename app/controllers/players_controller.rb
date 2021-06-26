class PlayersController < ApplicationController

  before_action :authenticate_user! 
  
  def new
    set_match(params[:game_id])
    @home = set_members(@match['homeTeam'])
    @away = set_members(@match['awayTeam'])
    rate = Rate.find_or_create_by(game_id: params[:game_id], user_id: current_user.id, home_team: @match["homeTeam"]["name"],away_team: @match["awayTeam"]["name"])
    @player = Form::PlayerCollection.new(rate_id: rate.id)
  end
  
  def create
    @player = Form::PlayerCollection.new(player_collection_params)
    @player.save ? (redirect_to games_path) : (redirect_back(fallback_location: root_path))
  end

  private
  def player_collection_params
    params.require(:form_player_collection)
    .permit(players_attributes: [:name, :player_rate, :rate_text, :position, :shirtnumber, :rate_id, :team_id])
  end
  
  def set_members(team)
    sub = @match['substitutions'].select {|s| s['team']['name'] == team['name'] } 
    sub.each do |s|
      team['lineup'] << { "name" => s["playerIn"]["name"], "position" => "SUB" }
    end
    team['lineup']
  end
  
end
