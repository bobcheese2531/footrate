class Rate < ApplicationRecord
  
  # association
  belongs_to :game
  belongs_to :user
  
  has_many :players, dependent: :destroy
  
  # scope
  scope :get_rates, -> { includes(:user).includes(:players).order(id: "DESC") } 
  scope :paginate, -> (params, count) { page(params).per(count).order(id: "DESC") }
  
  # search method
  def self.search(search)
    search ? (where(['home_team LIKE ? OR away_team LIKE ?', "%#{search}%" ,"%#{search}%"])) : (all)
  end

end
