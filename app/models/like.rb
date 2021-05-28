class Like < ApplicationRecord
  
  #アソシエーション
  belongs_to :user
  belongs_to :game
  
  #バリデーション
  validates_uniqueness_of :game_id, scope: :user_id   #一つの投稿に、一人はいいね一つしかできない
  
end
