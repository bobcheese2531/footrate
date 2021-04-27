class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #アソシエーション
  has_many :games, dependent: :destroy
  
  #バリデーション
  validates :name, presence: true, uniqueness: true #記入必須、'name'は被り禁止
  
  # ユーザーのプロフィール画像を表示
  mount_uploader :image, ImageUploader
  
end
