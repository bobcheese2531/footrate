module UsersHelper
  
  def profile_image(user)
    
    if user.image?
      image = content_tag(
        :img,
        "#{user.name}",
        src: "#{user.image}",
        height: 65,
        width: 65
        )
      content_tag(:a, image, href: "/users/#{user.id}")
      
    else
      
      image = content_tag(
        :img,
        "#{user.name}",
        src: "https://4.bp.blogspot.com/-xz7m7yMI-CI/U1T3vVaFfZI/AAAAAAAAfWI/TOJPmuapl-c/s800/figure_standing.png",
        height: 65,
        width: 65
        )
      content_tag(:a, image, href: "/users/#{user.id}")
      
    end
    
  end
  
  def other_user?(user)
    user_signed_in? && current_user != user
  end
  
  
end
