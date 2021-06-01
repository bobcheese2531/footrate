class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #アソシエーション
  has_many :games, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_games, through: :likes, source: :game
  has_many :chats, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverse_of_relationships, source: :user
  
  #バリデーション
  validates :name, presence: true, uniqueness: true #記入必須、'name'は被り禁止
  
  #ユーザーのプロフィール画像を表示
  mount_uploader :image, ImageUploader
  
  #メソッド
  #いいねしているか確認
  def already_liked?(game)
    self.likes.exists?(game_id: game.id)
  end
  #フォローする
  def follow(other_user)
    self.relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end
  #フォローを外す
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  #フォローしているか確認
  def following?(other_user)
    self.followings.include?(other_user)
  end
    
end
