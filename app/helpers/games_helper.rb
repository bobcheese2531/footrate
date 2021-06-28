module GamesHelper
  
  def game_date(date)
    date.slice(5..6) + '/' + date.slice(8..9)
  end
  
  def get_time(time)
    time.slice(11..15)
  end
    
  
end
