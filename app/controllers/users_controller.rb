class UsersController < ApplicationController
    
    #before_action
    before_action :set_user, only: %i[ show edit update ]
    before_action :authenticate_user!, except: [:show]
    
    # GET /users/id
    def show
    end
    
    # GET /users/id/edit
    def edit
    end
    
    # PATCH/PUT /users/id
    def update
      if @user.id == current_user.id
        @user.update(user_params)
      end
      redirect_to root_path
    end
    
    
    private
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :image, :user_text, :like_team)
    end
    
end
