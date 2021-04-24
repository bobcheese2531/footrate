class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update ]
    
    # GET /users/id
    def show
    end
    
    # GET /users/id/edit
    def edit
    end
    
    # PATCH/PUT /users/id
    def update
    end
    
    
    private
    
    def set_user
        @user = User.find(params[:id])
    end
    
    def user_params
        params.require(:user).permit(:name, :image, :user_text, :like_team)
    end
    
end
