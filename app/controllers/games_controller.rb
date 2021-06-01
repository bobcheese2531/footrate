class GamesController < ApplicationController
    
    #before_action
    before_action :authenticate_user!, except: [:index, :show]  #index, show以外はログインを必要とする
    before_action :set_game, only: %i[ show edit update destroy ]
    
    # GET /games
    def index
      @games = Game.get_games(params[:page], params[:search])
    end
    
    # GET /games/id
    def show
      set_comment_like
    end
    
    # GET /games/new
    def new
      @game = Game.new
      16.times{ @game.rates.build }   #選手用のフォームを16（人数分）用意
    end
    
    # GET /games/id/edit
    def edit
    end
    
    # POST /games
    def create
      @game = Game.new(game_params)
      @game.save ? (redirect_to action: :index) : (render "new")
    end
    
    # PATCH/PUT /games/id
    def update
      @game.update(game_params) if same_user?
      redirect_to action: :index
    end
    
    # DELETE /games/id
    def destroy
      @game.destroy if same_user?
      redirect_to action: :index
    end
    
    private
    def set_game
      @game = Game.find(params[:id])
    end
    
    def game_params
      params.require(:game).permit(:home_team, :away_team, :home_score, :away_score, :date, :game_text, :rate_team, :youtube_url,
      rates_attributes: [:game_id, :position, :player_name, :player_rate, :player_text, :id, :_destroy])  #複数モデルに同時保存用
      .merge(user_id: current_user.id)
    end
    
    def same_user?
      @game.user_id == current_user.id
    end
    
    def set_comment_like
      @comments = @game.comments  #表示するよう
      @comment = Comment.new  #新規投稿用
      @like = Like.new    #いいね
    end
  
end