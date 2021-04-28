class Room < ApplicationRecord
  #アソシエーション
  has_many :chats
  has_many :user_rooms
end
