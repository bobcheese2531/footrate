class CommentsController < ApplicationController
  before_action :authenticate_user! 
  
  def create
    @comment = Comment.create(comment_params)
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy 
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  def comment_params
    params.require(:comment).permit(:content).merge(game_id: params[:game_id], user_id: current_user.id)
  end
  
end
