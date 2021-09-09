module GamesHelper
  
  def competiton_title(code)
    if code == "PL"
      "プレミアリーグ"
    elsif code == "PD"
      "ラ・リーガ"
    elsif code == "BL1"
      "ブンデスリーガ"
    elsif code == "SA"
      "セリエＡ"
    elsif code == "FL1"
      "リーグ・アン"
    elsif code == "CL"
      "チャンピオンズリーグ"
    elsif code == "EC"
      "ユーロ2020"
    end
  end
  
  def match_date(date)
    date.in_time_zone.strftime('%Y/%m/%d')
  end
  
  def match_time(time)
    time.in_time_zone.strftime('%H:%M')
  end
  
  def scorer?(scorer, player, type)
    if scorer == player && type == "OWN"
      "OG"
    elsif scorer == player
      "G"
    end
  end
  
  def assist?(assist, player)
    "A" if assist == player 
  end
  
  def player_in?(sub, bench)
    "#{sub['minute']}' ↑" if bench['name'] == sub['playerIn']['name']
  end
  
  def player_out?(sub, start)
    "#{sub['minute']}' ↓" if start['name'] == sub['playerOut']['name']
  end
  
  def goal_team?(goal, team)
    if goal['team']['name'] == team
      if goal['type'] == "REGULAR"
        "#{goal['minute']}' #{goal['scorer']['name']}"
      elsif goal['type'] == "OWN"
        "#{goal['minute']}' #{goal['scorer']['name']}(OG)"
      elsif goal['type'] == "PENALTY"
        "#{goal['minute']}' #{goal['scorer']['name']}(PK)"
      end
    end
  end
  
  def match_scheduled?(status)
    status == "SCHEDULED"
  end
  
  def match_finished?(status)
    status == "FINISHED"
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
