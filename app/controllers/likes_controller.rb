class LikesController < ApplicationController
    
    #POST /games/id/likes
    def create
      @like = current_user.likes.create(game_id: params[:game_id])
      redirect_back(fallback_location: root_path)
    end
    
    #DELETE /games/id/likes
    def destroy
      @like = Like.find_by(game_id: params[:game_id], user_id: current_user.id)
      @like.destroy
      redirect_back(fallback_location: root_path)
    end
    
end
