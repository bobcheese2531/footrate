class Game < ApplicationRecord
  
  #association
  has_many :rates, dependent: :destroy
  has_many :comments, dependent: :destroy
  
end
