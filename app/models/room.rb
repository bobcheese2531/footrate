class Room < ApplicationRecord
  #アソシエーション
  has_many :chats, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
end
