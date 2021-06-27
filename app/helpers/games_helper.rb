module GamesHelper
  
  def game_date(date)
    date.slice(6) + '月' + date.slice(8..9) + '日'
  end
  
  def get_time(time)
    time.slice(11..15)
  end
    
  
end
