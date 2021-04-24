class ApplicationController < ActionController::Base
  
  #devise用
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :user_text, :like_team])
  end
  
end
