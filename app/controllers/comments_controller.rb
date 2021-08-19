class CommentsController < ApplicationController
  before_action :authenticate_user! 
  
  def create
    @comment = Comment.create(comment_params)
    redirect_to game_path(@comment.game_id)
  end
  
  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy 
      redirect_to game_path(comment.game_id)
    else
      redirect_to game_path(comment.game_id)
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content).merge(game_id: params[:game_id], user_id: current_user.id)
  end
  
end
