class Player < ApplicationRecord
  belongs_to :rate
  scope :rankings, -> { group(:name).order(Arel.sql('avg(player_rate) desc'), name: :desc).limit(10) }
end
