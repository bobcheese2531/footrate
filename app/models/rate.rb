class Rate < ApplicationRecord
  #アソシエーション
  belongs_to :game
    
  #バリデーション
  with_options presence: true do
    validates :player_name
    validates :position, length: { maximum: 3 } #最大3文字
    validates :player_text, length: { maximum: 100 } #最大100文字
    validates :player_rate, numericality: { only_integer: true } #数字のみ保存可能に
  end
  
end
