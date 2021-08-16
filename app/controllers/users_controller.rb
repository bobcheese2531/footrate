class UsersController < ApplicationController
    
  #before_action
    before_action -> { 
      authenticate_user!
      set_user
      same_user?(@user) 
    }
    
    # GET /users/id
    def show
      result = Api::FootballData::Request.get_team_matches(@user.like_team)
      @matches = result["matches"]
      @rates = Rate.get_rates.where(user_id: @user.id).paginate(params[:page], 6)
    end
    
    # GET /users/id/edit
    def edit
      result = Api::FootballData::Request.get_teams
      @teams = result["teams"].sort_by { |team| team["name"] }
    end
    
    # PATCH/PUT /users/id
    def update
      @user.update(user_params) ? (redirect_to user_path) : (render :edit)
    end
    
    private
    def set_user
      @user = User.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :image, :like_team)
    end
   
    def same_user?(user)
      redirect_to root_path unless user.id == current_user.id
    end
    
end
