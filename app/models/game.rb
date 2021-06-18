class Game < ApplicationRecord
    
  #アソシエーション
  has_many :rates, dependent: :destroy
  
end
