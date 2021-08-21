class Rate < ApplicationRecord
  
  belongs_to :game
  belongs_to :user
    
  has_many :players, dependent: :destroy
  
  # validates_uniqueness_of :game_id, scope: :user_id
  
  scope :get_rates, -> { includes(:user).includes(:players) } 
  scope :paginate, -> (params, count) { page(params).per(count).order(id: "DESC") }
  
  def self.search(search)
    search ? (where(['home_team LIKE ? OR away_team LIKE ?', "%#{search}%" ,"%#{search}%"])) : (all)
  end
  
end
