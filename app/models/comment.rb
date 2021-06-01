class Comment < ApplicationRecord
  
  #アソシエーション
  belongs_to :user
  belongs_to :game
  
  #バリデーション
  validates :comment, :presence => true, length: { maximum: 100 }
  
end
