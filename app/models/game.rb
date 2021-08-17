class Game < ApplicationRecord
    
  #アソシエーション
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  
end
