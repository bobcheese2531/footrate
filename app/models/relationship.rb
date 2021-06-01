class Relationship < ApplicationRecord
  # アソシエーション
  belongs_to :user
  belongs_to :follow, class_name: 'User'
  
  #バリデーション
  with_options presence: true do
    validates :user_id
    validates :follow_id
  end
  
end
