module UsersHelper
  
  def profile_image(user)
    if user.image?
      image = content_tag(
        :img,
        "",
        src: "#{user.image}",
        height: 150,
        width: 150
        )
      content_tag(:td, image)
    else
      image = content_tag(
        :img,
        "",
        src: "https://4.bp.blogspot.com/-xz7m7yMI-CI/U1T3vVaFfZI/AAAAAAAAfWI/TOJPmuapl-c/s800/figure_standing.png",
        height: 150,
        width: 150
        )
      content_tag(:td, image)
    end
  end
  
end
