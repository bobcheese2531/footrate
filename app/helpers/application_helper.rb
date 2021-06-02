module ApplicationHelper
  
  def same_user?(instance)
    user_signed_in? && current_user == instance.user
  end
  
end
