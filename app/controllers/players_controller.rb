class PlayersController < ApplicationController

  before_action :authenticate_user! 
  
  def new
    set_match(params[:game_id])
    rate = Rate.create(game_id: params[:game_id], user_id: current_user.id)
    @player = Form::PlayerCollection.new(rate_id: rate.id)
  end
  
  def create
    @player = Form::PlayerCollection.new(player_collection_params)
    if @player.save
      redirect_to games_path
    else
      redirect_to new_player_path
    end
  end

  private
  def player_collection_params
    params.require(:form_player_collection)
    .permit(players_attributes: [:name, :player_rate, :rate_text, :position, :shirtnumber, :rate_id])
  end
  
end
