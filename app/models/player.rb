class Player < ApplicationRecord
  belongs_to :rate
  
  with_options presence: true do
  	validates :name
  	validates :position
  	validates :player_rate, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10}
  	validates :rate_text, length: { maximum: 100 }
  	validates :shirtnumber
  	validates :rate_id
  	validates :team_id
	end
	
end
