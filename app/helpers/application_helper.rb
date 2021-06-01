module ApplicationHelper
  
  def same_user?(instance)
    user_signed_in? && current_user.id == instance.user.id
  end
  
end
