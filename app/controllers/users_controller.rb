class UsersController < ApplicationController
    
  #before_action
    before_action :set_user, only: %i[ show edit update ]
    before_action :authenticate_user!, except: [:show]
    
    # GET /users/id
    def show
    end
    
    # GET /users/id/edit
    def edit
      redirect_to action: :show unless same_user?
    end
    
    # PATCH/PUT /users/id
    def update
      @user.update(user_params) if same_user?
      redirect_to user_path
    end
    
    private
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :image, :user_text, :like_team)
    end
    
    def same_user?
      @user.id == current_user.id
    end
    
end
