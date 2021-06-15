class PlayersController < ApplicationController

  def show
  end
  
  def new
    id = params[:game_id]
    @result= Api::FootballData::Request.show_game(id)
    @home = @result["match"]["homeTeam"]["lineup"]
    @away = @result["match"]["awayTeam"]["lineup"]
    rate = Rate.create(game_id: params[:game_id], user_id: current_user.id)
    @player = Form::PlayerCollection.new(rate_id: rate.id)
  end
  
  def create
    @player = Form::PlayerCollection.new(player_collection_params)
    if @player.save
      redirect_to games_path
    else
      render :new
    end

  end

  private
  def player_collection_params
    params.require(:form_player_collection)
    .permit(players_attributes: [:name, :player_rate, :rate_text, :position, :shirtnumber, :rate_id])
  end
  
end
