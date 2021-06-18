class PlayersController < ApplicationController

  before_action :authenticate_user! 
  
  def new
    rate = Rate.find_or_create_by(game_id: params[:game_id], user_id: current_user.id)
    @player = Form::PlayerCollection.new(rate_id: rate.id)
    set_match(params[:game_id])
  end
  
  def create
    @player = Form::PlayerCollection.new(player_collection_params)
    @player.save ? (redirect_to games_path) : (redirect_back(fallback_location: root_path))
  end

  private
  def player_collection_params
    params.require(:form_player_collection)
    .permit(players_attributes: [:name, :player_rate, :rate_text, :position, :shirtnumber, :rate_id])
  end
  
end
