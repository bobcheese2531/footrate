class CommentsController < ApplicationController
    
     # POST /game/id/comment
    def create
      @comment = Comment.new(comment_params)
      @comment.save if @comment.user_id = current_user.id
      redirect_back(fallback_location: root_path)
    end
    
    private
    def comment_params
        params.require(:comment).permit(:comment).merge(game_id: params[:game_id])
    end
end
