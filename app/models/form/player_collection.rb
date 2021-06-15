class Form::PlayerCollection < Form::Base
  PLAYER_COUNT = 1
  attr_accessor :players, :rate_id
  
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
    return true
  end
  
end