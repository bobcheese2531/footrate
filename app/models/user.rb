class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #アソシエーション
  has_many :games, dependent: :destroy
    #コメント機能
  has_many :comments, dependent: :destroy
    #いいね機能
  has_many :likes, dependent: :destroy
  has_many :liked_games, through: :likes, source: :game
  
  #バリデーション
  validates :name, presence: true, uniqueness: true #記入必須、'name'は被り禁止
  
  #ユーザーのプロフィール画像を表示
  mount_uploader :image, ImageUploader
  
  #メソッド
    #いいねしているか確認
    def already_liked?(game)
      self.likes.exists?(game_id: game.id)
    end
    
end
