class CommentsController < ApplicationController
    
     # POST /game/id/comment
    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
            redirect_back(fallback_location: root_path)
        else
            redirect_back(fallback_location: root_path)
        end
    end
    
    private
    def comment_params
        params.require(:comment).permit(:comment).merge(game_id: params[:game_id])
    end
end
