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
  validates :home_team, :presence => true, length: { is: 3 }  #チーム名3文字
  validates :away_team, :presence => true, length: { is: 3 }
  validates :home_score, :presence => true, numericality: { only_integer: true }  #数字のみ許可
  validates :away_score, :presence => true, numericality: { only_integer: true }
  validates :date, :presence => true
  validates :game_text, length: { maximum: 150 }   #最大150文字
  validates :rate_team, :presence => true, length: { is: 3 }
    
  #検索機能
  def self.search(search)
    return Game.all unless search
    Game.where('home_team LIKE ? OR away_team LIKE?', "%#{search}%", "%#{search}%") 
  end
  
  def self.get_games(page, search)
    Game.includes(:user).page(page).per(9).order('created_at DESC').search(search)
  end
  
end
