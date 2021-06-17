class ApplicationController < ActionController::Base
  
  #devise用
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :user_text, :like_team])
  end
  
  def set_matches(code)
    result = Api::FootballData::Request.get_games(code)
    @matches = result["matches"]
  end
  
  def set_match(id)
    result= Api::FootballData::Request.show_game(id)
    @match = result["match"]
  end
  
end
