class Form::PlayerCollection < Form::Base
	
  PLAYER_COUNT = 1
  attr_accessor :players, :rate_id, :name, :position, :player_rate, :rate_text, :shirtnumber
  
  with_options presence: true do
  	validates :name
  	validates :position
  	validates :player_rate, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 10}
  	validates :rate_text, length: { maximum: 100 }
  	validates :shirtnumber
  	validates :rate_id
	end
  
  def initialize(attributes = {})
    super attributes
    self.players = PLAYER_COUNT.times.map { Player.new(rate_id: rate_id) } unless self.players.present?
  end
  
  def players_attributes=(attributes)
    self.players = attributes.map { |_, v| Player.new(v) }
  end
  
  def save
  	
    Player.transaction do
      self.players.map do |player|
        player.save
      end
    end
  end
   
end