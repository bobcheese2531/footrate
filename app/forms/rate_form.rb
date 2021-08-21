class RateForm
  include ActiveModel::Model
  include Virtus.model
  
  with_options presence: true do
  	validates :home_team
  	validates :away_team
  end
  
  attribute :home_team, String
  attribute :away_team, String
  attribute :game_id, Integer
  attribute :user_id, Integer
  
  attr_accessor :players
  
  def initialize(rate = Rate.new)
    @rate = rate
    self.attributes = @rate.attributes if @rate.persisted?
  end
  
  def assign_attributes(params = {})
    @params = params
    players_attributes = params[:players_attributes]
    @players ||= []
    players_attributes&.map do |player_attribute|
      player = Player.new(player_attribute)
      @players.push(player)
    end
    @params.delete(:players_attributes)
    @rate.assign_attributes(@params) if @rate.persisted?
    super(@params)
  end
  
  def save
    return false if invalid?
    if @rate.persisted?
      @rate.players = players if players.present?
      @rate.save!
    else
      rate = Rate.new(user_id: user_id,
                      home_team: home_team,
                      away_team: away_team,
                      game_id: game_id)
      rate.players = players if players.present?
      rate.save!
    end
  end
  
end
    