class Rate < ApplicationRecord
    #アソシエーション
    belongs_to :game
    
    #バリデーション
    validates :position, presence: true, length: { maximum: 3 } #最大3文字
    validates :player_name, presence: true
    validates :player_text, presence: true, length: { maximum: 100 } #最大100文字
    validates :player_rate, presence: true, numericality: { only_integer: true } #数字のみ保存可能に
end
