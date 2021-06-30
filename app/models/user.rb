class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #アソシエーション
  has_many :rates, dependent: :destroy
  
  #バリデーション
  validates :name, presence: true, uniqueness: true
  validates :like_team, presence: true
  
  mount_uploader :image, ImageUploader
  
end
