require 'rails_helper'

RSpec.describe Rate, type: :model do
  
  before do
    @user = create(:user)
    @game = create(:game)
  end
  
  it "ホームチームとアウェイチームがある場合有効" do
    rate = build(:rate, user_id: @user.id, game_id: @game.id)
    expect(rate).to be_valid
  end
  
  it "ホームチームがない場合無効" do
    rate = build(:rate, user_id: @user.id, game_id: @game.id, home_team: "")
    rate.valid?
    expect(rate.errors[:home_team]).to include("を入力してください")
  end
  
  it "アウェイチームがない場合無効" do
    rate = build(:rate, user_id: @user.id, game_id: @game.id, away_team: "")
    rate.valid?
    expect(rate.errors[:away_team]).to include("を入力してください")
  end
  
end