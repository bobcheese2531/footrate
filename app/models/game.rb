class Game < ApplicationRecord
    
  #アソシエーション
  has_many :rates, dependent: :destroy
  
  #検索機能
  def self.search(search)
    return Game.all unless search
    Game.where('home_team LIKE ? OR away_team LIKE?', "%#{search}%", "%#{search}%") 
  end
  
  def self.get_games(page, search)
    Game.includes(:user).page(page).per(9).order('created_at DESC').search(search)
  end
  
end
