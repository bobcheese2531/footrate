class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :game
  
  validates :content, presence: true
  
end
