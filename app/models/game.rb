class Game < ApplicationRecord
    #アソシエーション
    belongs_to :user
    has_many :rates
    accepts_nested_attributes_for :rates, allow_destroy: true   #複数モデルへの同時保存に必要
    
    
    #バリデーション
    validates :home_team, :presence => true, length: { is: 3 }  #チーム名3文字
    validates :away_team, :presence => true, length: { is: 3 }
    validates :home_score, :presence => true, numericality: { only_integer: true }  #数字のみ許可
    validates :away_score, :presence => true, numericality: { only_integer: true }
    validates :date, :presence => true
    validates :game_text, :presence => true, length: { maximum: 150 }   #最大150文字
    validates :rate_team, :presence => true, length: { is: 3 }
    validates :youtube_url, allow_blank: true   #空でも保存可能
end
