class Comment < ApplicationRecord
  
  # association
  belongs_to :user
  belongs_to :game
  
  # validation
  validates :content, presence: true
  
end
