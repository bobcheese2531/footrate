module GamesHelper
  
  def game_date(date)
    date.slice(5..6) + '/' + date.slice(8..9)
  end
  
  def get_time(time)
    time.slice(11..15)
  end
  
  def scorer?(scorer, player)
    "G" if scorer == player
  end
  
  def player_in?(sub, b)
    "#{sub["minute"]}' ↑" if b["name"] == sub["playerIn"]["name"]
  end
  
  def player_out?(sub, l)
    "#{sub["minute"]}' ↓" if l["name"] == sub["playerOut"]["name"]
  end
  
  def goal_team?(goal, team)
    "#{goal["minute"]}' #{goal["scorer"]["name"]}" if goal["team"]["name"] == team
  end
  
  def match_finished?(status)
    status == "FINISHED"
  end
  
  def score_home(m)
    m['score']['fullTime']['homeTeam'].to_i - m['score']['penalties']['homeTeam'].to_i
  end
  
  def score_away(m)
    m['score']['fullTime']['awayTeam'].to_i - m['score']['penalties']['awayTeam'].to_i
  end
  
  def penalties?(m)
    m['score']['duration'] == "PENALTY_SHOOTOUT"
  end
    
  
end
