module GamesHelper
  
  def game_time(time)
    time.slice(6) + '月' + time.slice(8..9) + '日' + time.slice(11..15)
  end
end
