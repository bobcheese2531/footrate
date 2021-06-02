module GamesHelper
  
  def score(game)
    "#{game.home_team} #{game.home_score} : #{game.away_score} #{game.away_team}"
  end
  
  def youtube(game)
    if game.youtube_url?
      iframe = content_tag(
      :iframe,
      "",
      src: "https://www.youtube.com/embed/#{game.youtube_url.last(11)}",
      frameborder: "0",
      allowfullscreen: true
      )
      content_tag(:td, iframe)
    end 
  end
  
end
