class GamesController < ApplicationController
    
    #before_action
    before_action :set_game, only: %i[ show edit update destroy ]
    before_action :authenticate_user!, except: [:index, :show]  #index, show以外はログインを必要とする
    
    # GET /games
    def index
        @games = Game.all.search(params[:search])
    end
    
    # GET /games/id
    def show
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
        
        #YouTubeのURL取得
        url = params[:game][:youtube_url]
        url = url.last(11)  #動画を識別する最後の11桁を取得
        @game.youtube_url = url
        
        if @game.save
            redirect_to action: :index  #保存されたらルートパスに移動
        else
            render "new"    #保存できなかったら再びフォームに移動
        end
        
    end
    
    # PATCH/PUT /games/id
    def update
        if @game.user_id == current_user.id #投稿者のみ編集可能
            url = params[:game][:youtube_url]
            url = url.last(11)
            @game.youtube_url = url
            @game.update(game_params)
        end
        redirect_to action: :index
    end
    
    # DELETE /games/id
    def destroy
        if @game.user_id == current_user.id #投稿者のみ削除可能
            @game.destroy
        end
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
    
end
