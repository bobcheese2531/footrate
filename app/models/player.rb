class Player < ApplicationRecord
  belongs_to :rate
 
  with_options presence: true do
  	validates :name
  	validates :position
  	validates :player_rate, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10}
  	validates :shirtnumber
  	validates :rate_id
  	validates :team_id
	end
	validates_uniqueness_of :name, scope: :rate_id
  
  scope :rankings, -> { group(:name).order(Arel.sql('avg(player_rate) desc'), name: :desc).limit(10) }
end
