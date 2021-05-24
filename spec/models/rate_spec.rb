require 'rails_helper'

RSpec.describe Rate, type: :model do
  it "ポジション, 選手名, 感想, 評価がある場合有効" do
    game = Game.new(id: 1)
    rate = create(d: 1, game_id: game.id, position: "CMF", player_name: "KDB", player_text: "最高だった", player_rate: 10)
    expect(rate).to be_valid
  end  
end