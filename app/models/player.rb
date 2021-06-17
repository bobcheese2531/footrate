class Player < ApplicationRecord
  belongs_to :rate
    
  with_options presence: true do
    validates :name
    validates :position
    validates :player_rate
    validates :rate_text
    validates :shirtnumber
  end
  
  
  
end
