class Player < ApplicationRecord
  belongs_to :rate
  
  scope :rankings, -> { group(:name).order(Arel.sql('avg(player_rate) desc'), name: :desc).limit(10) }
  scope :group_best, -> { group(:position, :name).order('avg(player_rate) desc') }
  scope :best, -> (position, num) { where(position: position).limit(num)}

end
