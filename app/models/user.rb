class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  #association
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  #validation
  validates :name, presence: true, uniqueness: true
  validates :like_team, presence: true
  
end
