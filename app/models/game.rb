class Game < ApplicationRecord
    
  #アソシエーション
  belongs_to :user
    #複数モデルへの同時保存に必要
  has_many :rates, dependent: :destroy
  accepts_nested_attributes_for :rates, allow_destroy: true 
    #コメント機能
  has_many :comments, dependent: :destroy
    #いいね機能
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
    
  #バリデーション
  with_options presence: true do
    validates :date
    
    with_options numericality: { only_integer: true } do  #数字のみ許可
      validates :home_score
      validates :away_score
    end
    
    with_options length: { is: 3 } do #3文字のみ保存可能
      validates :rate_team
      validates :home_team
      validates :away_team
    end
    
  end
  validates :game_text, length: { maximum: 150 }
  
  #検索機能
  def self.search(search)
    return Game.all unless search
    Game.where('home_team LIKE ? OR away_team LIKE?', "%#{search}%", "%#{search}%") 
  end
  
  def self.get_games(page, search)
    Game.includes(:user).page(page).per(9).order('created_at DESC').search(search)
  end
  
end
