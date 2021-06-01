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
  
  enum position: {'GK': 'GK', 'CB': 'CB', 'RB': 'RB', 'LB': 'LB', 'DMF': 'DMF', 'CMF': 'CMF', 'OMF': 'OMF', 
                  'RMF': 'RMF', 'LMF': 'LMF', 'RWG': 'RWG', 'LWG': 'LWG', 'ST': 'ST', 'CF': 'CF' }
                  
  enum player_rate: {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, 
                    '6': 6, '7': 7, '8': 8, '9': 9, '10': 10}
end
