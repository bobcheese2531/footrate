module ApplicationHelper
  
  def same_user?(user)
    user_signed_in? && current_user == user
  end
  
  # def c_profile_image(c)
    
  #   if c.user.image?
  #     image = content_tag(
  #       :img,
  #       "#{c.user.name}",
  #       src: "#{c.user.image}",
  #       height: 65,
  #       width: 65
  #       )
  #     content_tag(:a, image, href: "/users/#{c.user.id}")
      
  #   else
      
  #     image = content_tag(
  #       :img,
  #       "#{c.user.name}",
  #       src: "https://4.bp.blogspot.com/-xz7m7yMI-CI/U1T3vVaFfZI/AAAAAAAAfWI/TOJPmuapl-c/s800/figure_standing.png",
  #       height: 65,
  #       width: 65
  #       )
  #     content_tag(:a, image, href: "/users/#{c.user.id}")
      
  #   end
    
  # end
  
end
