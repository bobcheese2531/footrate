class UsersController < ApplicationController
    
  #before_action
    before_action :set_user, only: %i[ show edit update ]
    before_action :authenticate_user!
    
    # GET /users/id
    def show
      result = Api::FootballData::Request.get_team_matches(@user.like_team)
      @matches = result["matches"]
      @rates = Rate.get_rates.where(user_id: @user.id).paginate(params[:page], 5)
      same_user?(@user) ? (render :show) : (redirect_to root_path)
    end
    
    # GET /users/id/edit
    def edit
      result = Api::FootballData::Request.get_teams
      @teams = result["teams"].sort_by { |team| team["name"] }
      same_user?(@user) ? (render :edit) : (redirect_to root_path)
    end
    
    # PATCH/PUT /users/id
    def update
      @user.update(user_params) if same_user?(@user)
      redirect_to user_path
    end
    
    private
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :image, :like_team)
    end
   
    def same_user?(user)
      user.id == current_user.id
    end 
    
end
