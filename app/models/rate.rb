class Rate < ApplicationRecord
  
  belongs_to :game
  belongs_to :user
    
  has_many :players
  
  validates_uniqueness_of :game_id, scope: :user_id
end
