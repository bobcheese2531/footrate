module GamesHelper
  
  def game_date(date)
    date.in_time_zone.strftime('%Y/%m/%d')
  end
  
  def get_time(time)
    time.in_time_zone.strftime('%H:%M')
  end
  
  def scorer?(goal, player)
    if goal['scorer']['name'] == player && goal["type"] == "OWN"
      "OG"
    elsif goal['scorer']['name'] == player
      "G"
    end
  end
  
  def assist?(assist, player)
    "A" if assist == player 
  end
  
  def player_in?(sub, bench)
    "#{sub["minute"]}' ↑" if bench["name"] == sub["playerIn"]["name"]
  end
  
  def player_out?(sub, start)
    "#{sub["minute"]}' ↓" if start["name"] == sub["playerOut"]["name"]
  end
  
  def goal_team?(goal, team)
    if goal["type"] == "REGULAR" && goal["team"]["name"] == team
      "#{goal["minute"]}' #{goal["scorer"]["name"]}"
    elsif goal["type"] == "OWN" && goal["team"]["name"] == team
      "#{goal["minute"]}' #{goal["scorer"]["name"]}(OG)"
    elsif goal["type"] == "PENALTY" && goal["team"]["name"] == team
      "#{goal["minute"]}' #{goal["scorer"]["name"]}(PK)"
    end
  end
  
  def match_scheduled?(status)
    status == "SCHEDULED"
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
  
  def team_logo(team)
    "https://crests.football-data.org/#{team}.svg"
  end
  
  def ht_score(match)
    "#{match['score']['halfTime']['homeTeam']} - #{match['score']['halfTime']['awayTeam']}" 
  end
    
  
end
